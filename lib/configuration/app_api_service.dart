import 'package:dio/dio.dart';
import 'package:flutter_attendance_application/configuration/app_auth_interceptor.dart';
import 'package:flutter_attendance_application/configuration/app_environment.dart';
import 'package:flutter_attendance_application/configuration/app_secure_storage.dart';

enum DioMethod { post, get, put, delete }

class AppApiService {
  AppApiService._singleton();
  static final AppApiService instance = AppApiService._singleton();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ProfileConstants.api,
      contentType: Headers.jsonContentType,
    ),
  )..interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
      AppAuthInterceptor(
        appSecureStorage: AppSecureStorage(),
      ),
    ]);

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    dynamic formData,
    bool isUseAccessToken = true,
  }) async {
    // update access-token usage dynamically
    _dio.interceptors.removeWhere((i) => i is AppAuthInterceptor);
    _dio.interceptors.add(
      AppAuthInterceptor(
        appSecureStorage: AppSecureStorage(),
        isUseAccessToken: isUseAccessToken,
      ),
    );

    switch (method) {
      case DioMethod.post:
        return _dio.post(endpoint, data: param ?? formData);
      case DioMethod.get:
        return _dio.get(endpoint, queryParameters: param);
      case DioMethod.put:
        return _dio.put(endpoint, data: param ?? formData);
      case DioMethod.delete:
        return _dio.delete(endpoint, data: param ?? formData);
    }
  }
}
