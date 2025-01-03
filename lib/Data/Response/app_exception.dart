class AppException implements Exception {
  final message;
  final prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error during communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Bad Request Error");
}

class UnAuthorizeAccess extends AppException {
  UnAuthorizeAccess({String? message}) : super(message, "UnAuthorize Access");
}
