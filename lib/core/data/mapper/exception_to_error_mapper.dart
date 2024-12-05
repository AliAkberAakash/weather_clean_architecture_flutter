import 'package:weather_clean_architecture_flutter/core/data/exceptions/base_exception.dart';
import 'package:weather_clean_architecture_flutter/core/data/exceptions/network_exceptions.dart';
import 'package:weather_clean_architecture_flutter/core/domain/error/error.dart';

abstract class ExceptionToErrorMapper {
  BaseError map(final BaseException exception);
}

class ExceptionToErrorMapperImpl extends ExceptionToErrorMapper {
  @override
  BaseError map(final BaseException exception) {
    switch (exception.runtimeType) {
      case const (ServerException):
        exception as ServerException;
        return ServerError(
            statusCode: exception.statusCode,
            statusMessage: exception.statusMessage);
      case const (NetworkException):
        return NetworkError();
      case const (NetworkTimeoutException):
        return NetworkTimeoutError();
      default:
        return CommonError();
    }
  }
}
