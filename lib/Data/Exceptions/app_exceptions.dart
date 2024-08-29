class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

class Unauthorizedexception extends AppExceptions {
  Unauthorizedexception([String? message])
      : super(message, 'Unauthorized Access');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, 'Request Timed Out');
} 

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message,'');
}
