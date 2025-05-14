// ignore_for_file: strict_raw_type, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:http_client/src/exceptions/exceptions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';

/// {@category HttpClient}
/// {@template http}
/// A class that provides methods for making HTTP requests.
/// It uses the Dio package for making requests and handles errors using
/// the `ApiExceptionHandler` class.
/// It also includes retry logic for certain types of errors.
/// The class is designed to be used as a singleton.
/// {@endtemplate}
class Http {
  /// {@macro http}
  Http()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 8),
            receiveTimeout: const Duration(seconds: 15),
          ),
        )
          ..interceptors.add(PrettyDioLogger())
          ..addSentry(captureFailedRequests: true) {
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        retryEvaluator: (error, attempt) {
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.receiveTimeout) {
            return true;
          }

          return false;
        },
        retryDelays: const [
          Duration(milliseconds: 700),
          Duration(milliseconds: 800),
          Duration(milliseconds: 900),
        ],
      ),
    );
  }
  final _errorHandler = const ApiExceptionHandler();

  final Dio _dio;

  /// Performs a GET request to the specified [path] with the given [data].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> get(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      return await _dio.get(path, data: data);
    } on DioException catch (e) {
      // TODO: Show info dialog "Can't connect to webserver" if it's TimedOutException
      // Decide if we have a listener for ApiException in root and show dialog from there
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a RAW GET request to the specified [path] with the given [data].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> rawGet(
    Uri uri,
  ) async {
    try {
      return await _dio.getUri(uri);
    } on DioException catch (e) {
      // TODO: Show info dialog "Can't connect to webserver" if it's TimedOutException
      // Decide if we have a listener for ApiException in root and show dialog from there
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a POST request to the specified [path] with the given [data].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> post(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a PATCH request to the specified [path] with the given [data].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> patch(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.patch(path, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a DELETE request to the specified [path] with the given [data].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> delete(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.delete(path, data: data);
    } on DioException catch (e) {
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a Multipart POST request to the specified [path] with the given
  /// [data]. Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> postMultipart(
    String path,
    Map<String, dynamic> data,
  ) async {
    final formData = FormData.fromMap(data);
    return _dio.post(path, data: formData);
  }

  /// Performs a Multipart PATCH request to the specified [path] with the given
  /// [data]. Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Response> patchMultipart(
    String path,
    Map<String, dynamic> data,
  ) async {
    try {
      final formData = FormData.fromMap(data);
      return _dio.patch(path, data: formData);
    } on DioException catch (e) {
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a GET (image) request to the specified [url].
  /// Returns the response from the server.
  /// Throws an [HttpException] if the request fails.
  Future<Uint8List> getFile(String url) async {
    try {
      return (await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      ))
          .data as Uint8List;
    } on DioException catch (e) {
      throw _mapDioErrorToException(e);
    }
  }

  /// Performs a health check to verify if the server is reachable.
  /// Throws an [ApiNoNetworkException] if the server is not reachable.
  /// This method is used to check if the server is up and running.
  /// It is recommended to use this method before making any API calls.
  Future<void> checkConnection() async {
    try {
      // TODO: Add health check endpoint
      await _dio.get(
        '',
      );
    } on DioException {
      // Show info that can't connect to webserver
      throw ApiNoNetworkException();
    }
  }

  HttpException _mapDioErrorToException(DioException e) {
    switch (e.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
        return _errorHandler.mapTimeOut(e);
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return _errorHandler.networkError(e);
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return _errorHandler.mapStatusCode(e);
    }
  }
}
