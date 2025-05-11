// TODO: Show error message sent by the server in body of the dialog
/// Base class of other exceptions that occur during http requests
class HttpException implements Exception {
  HttpException(
    this.type, {
    required this.title,
    required this.body,
    required this.stackTrace,
    this.fatal = false,
  });

  final Object type;
  final String title;
  final String body;
  final StackTrace? stackTrace;
  final bool fatal;
}

/// Exception thrown when connection to server times out
class TimedOutException extends HttpException {
  TimedOutException({required StackTrace? stackTrace})
      : super(
          TimedOutException,
          title: 'Server Timed Out',
          body: 'An error has occurred while trying to connect to the server. '
              'Please try again later',
          stackTrace: stackTrace,
        );
}

/// Exception thrown when status code is 4XX or 5XX
class StatusCodeException extends HttpException {
  StatusCodeException({
    required String title,
    required StackTrace? stackTrace,
    required String body,
    required this.statusCode,
    bool fatal = false,
  }) : super(
          StatusCodeException,
          title: title,
          body: body,
          stackTrace: StackTrace.fromString(
            'Http status code: $statusCode \n $stackTrace',
          ),
          fatal: fatal,
        );
  final int statusCode;
}

/// Exception thrown when there is no internet connection
class ApiNoNetworkException extends HttpException {
  ApiNoNetworkException({StackTrace? stackTrace})
      : super(
          ApiNoNetworkException,
          title: 'Internet Error',
          body: 'No internet connection',
          stackTrace: stackTrace,
        );
}
