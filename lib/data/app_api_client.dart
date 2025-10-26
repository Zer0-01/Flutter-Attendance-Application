import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/env/env_dev.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppApiClient {
  final Dio _client;
  final AppLogger _logger = AppLogger.getLogger("AppApiClient");
// Constructor
  AppApiClient()
      : _client = Dio(
          BaseOptions(
            baseUrl: EnvDev.baseUrl,
            sendTimeout: const Duration(milliseconds: 60000),
            receiveTimeout: const Duration(milliseconds: 60000),
            connectTimeout: const Duration(milliseconds: 60000),
            followRedirects: false,
            receiveDataWhenStatusError: true,
          ),
        ) {
    _client.interceptors.addAll([
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
          filter: (options, args) {
            // don't print requests with uris containing '/posts'
            if (options.path.contains('/posts')) {
              return false;
            }
            // don't print responses with unit8 list data
            return !args.isResponse || !args.hasUint8ListData;
          })
    ]);
  }

// GET request
  Future<Map<String, dynamic>?> get(
    String url, {
    Map<String, String>? queryParams = const {},
    Map<String, String>? headers = const {},
  }) async {
    return _request(
      () => _client.get(url, queryParameters: queryParams),
      headers: headers,
    );
  }

// POST request
  Future<Map<String, dynamic>?> post(
    String url,
    dynamic payLoad, {
    Map<String, String>? headers = const {},
  }) async {
    return _request(
      () => _client.post(url, data: payLoad),
      headers: headers,
    );
  }

// Private method to handle requests
  Future<Map<String, dynamic>?> _request(
    Future<Response> Function() request, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      _logger.error('Request failed: ${e.message}');
      return null;
    }
  }
}
