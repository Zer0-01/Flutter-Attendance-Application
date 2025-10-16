import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_attendance_application/configuration/app_environment.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/configuration/app_secure_storage.dart';
import 'package:flutter_attendance_application/data/api_endpoints.dart';

class AppAuthInterceptor extends Interceptor {
  final AppSecureStorage appSecureStorage;
  final bool isUseAccessToken;
  final AppLogger _logger = AppLogger.getLogger("AppAuthInterceptor");

  // Shared lock and queue across the app
  static Completer<bool>? _refreshCompleter;
  static final List<_PendingRequest> _pendingRequests = [];

  AppAuthInterceptor({
    required this.appSecureStorage,
    this.isUseAccessToken = true,
  });

  // ------------------- REQUEST -------------------
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!isUseAccessToken) return handler.next(options);

    final accessToken = await appSecureStorage.read(
      SecureStorageKeys.accessToken.name,
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  // ------------------- ERROR -------------------
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_isUnauthorized(err)) {
      return super.onError(err, handler);
    }

    final completer = Completer<Response>();
    _pendingRequests.add(_PendingRequest(err.requestOptions, completer));

    // If a refresh is already ongoing → wait for it
    if (_refreshCompleter != null) {
      _logger.debug("Waiting for ongoing refresh...");
      final refreshed = await _refreshCompleter!.future;
      if (refreshed) {
        final response = await _retryRequest(err.requestOptions);
        return handler.resolve(response);
      } else {
        return handler.reject(err);
      }
    }

    // Otherwise, start a new refresh cycle
    _refreshCompleter = Completer<bool>();

    try {
      final refreshed = await _doRefreshToken();
      _refreshCompleter!.complete(refreshed);

      if (refreshed) {
        await _retryAllPendingRequests();
      } else {
        _failAllPendingRequests(err);
      }
    } catch (e) {
      _logger.error("Refresh process crashed: $e");
      _refreshCompleter!.complete(false);
      _failAllPendingRequests(err);
    } finally {
      _refreshCompleter = null;
    }

    try {
      final response = await completer.future;
      return handler.resolve(response);
    } catch (_) {
      return handler.reject(err);
    }
  }

  bool _isUnauthorized(DioException err) => err.response?.statusCode == 401;

  // ------------------- REFRESH TOKEN -------------------
  Future<bool> _doRefreshToken() async {
    final accessToken =
        await appSecureStorage.read(SecureStorageKeys.accessToken.name);
    final refreshToken =
        await appSecureStorage.read(SecureStorageKeys.refreshToken.name);

    if (accessToken == null || refreshToken == null) {
      _logger.error("Missing tokens — cannot refresh.");
      return false;
    }

    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ProfileConstants.api,
          contentType: Headers.jsonContentType,
        ),
      );

      final response = await refreshDio.post(
        ApiEndpoints.updateProfile,
        data: {'refresh_token': refreshToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      final newAccessToken = response.data?['data']?['access_token'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        _logger.error("Refresh token failed — invalid response format");
        return false;
      }

      await appSecureStorage.save(
        SecureStorageKeys.accessToken.name,
        newAccessToken,
      );

      _logger.debug("Token refreshed successfully.");
      return true;
    } catch (e) {
      _logger.error("Refresh token request failed: $e");
      await appSecureStorage.clear();
      return false;
    }
  }

  // ------------------- RETRY -------------------
  Future<void> _retryAllPendingRequests() async {
    final requests = List<_PendingRequest>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final pending in requests) {
      try {
        final response = await _retryRequest(pending.requestOptions);
        pending.completer.complete(response);
      } catch (e) {
        pending.completer.completeError(e);
      }
    }
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final newAccessToken =
        await appSecureStorage.read(SecureStorageKeys.accessToken.name);

    final retryDio = Dio(
      BaseOptions(
        baseUrl: requestOptions.baseUrl,
        contentType: Headers.jsonContentType,
      ),
    );

    final clonedHeaders = Map<String, dynamic>.from(requestOptions.headers);
    clonedHeaders['Authorization'] = 'Bearer $newAccessToken';

    final response = await retryDio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: clonedHeaders,
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
        followRedirects: requestOptions.followRedirects,
        validateStatus: requestOptions.validateStatus,
      ),
    );

    return response;
  }

  void _failAllPendingRequests(DioException err) {
    for (final pending in _pendingRequests) {
      pending.completer.completeError(err);
    }
    _pendingRequests.clear();
  }
}

// ------------------- MODEL -------------------
class _PendingRequest {
  final RequestOptions requestOptions;
  final Completer<Response> completer;
  _PendingRequest(this.requestOptions, this.completer);
}
