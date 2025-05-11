import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_client/src/exceptions/exceptions.dart';

class ApiExceptionHandler {
  const ApiExceptionHandler();

  /// Throws a `TimedOutException`
  TimedOutException mapTimeOut(DioException error) {
    return TimedOutException(stackTrace: error.stackTrace);
  }

  /// Maps status code errors to their respective `StatusCodeException`
  StatusCodeException mapStatusCode(DioException error) {
    debugPrint('Status Code:');
    debugPrint(error.response?.statusCode.toString());
    switch (error.response?.statusCode) {
      case 400:
        if (kDebugMode) {
          print('Json Request has invalid syntax');
        } else {
          return StatusCodeException(
            title: 'Error',
            body: 'An unknown error has occurred. Please try again later.',
            statusCode: error.response!.statusCode!,
            stackTrace: error.stackTrace,
          );
        }
      case 401:
      case 403:
        return StatusCodeException(
          title: 'Authentication Error',
          body: 'An error has occurred while trying to authenticate the user. '
              'Try logging out and logging back in again.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 404:
        return StatusCodeException(
          title: 'Request Error',
          body: 'An error has occurred while requesting data to the server. '
              'Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 408:
        return StatusCodeException(
          title: 'Connection Timed Out',
          body: 'The server took too long to respond. Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 409:
        return StatusCodeException(
          title: 'Connection Timed Out',
          body: 'An unknown error has occurred. Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 429:
        return StatusCodeException(
          title: 'Request limit exceeded',
          body: 'Too many requests have been sent to the server at a short '
              'period of time. Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 500:
        return StatusCodeException(
          title: 'Internal Server Error',
          body: 'An internal server error has occurred. We will do '
              'our best to fix it. Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
      case 502:
      case 503:
        return StatusCodeException(
          title: 'Servers are Down',
          body:
              'Our servers are currently down. We will do our best to fix it. '
              'Please try again later.',
          statusCode: error.response!.statusCode!,
          stackTrace: error.stackTrace,
        );
    }
    return StatusCodeException(
      title: 'Error',
      body: 'An unknown error has occurred. Please try again later.',
      statusCode: error.response?.statusCode ?? 0,
      stackTrace: error.stackTrace,
    );
  }

  /// Throws a `ApiNoNetworkException`
  ApiNoNetworkException networkError(DioException error) {
    return ApiNoNetworkException(stackTrace: error.stackTrace);
  }
}
