import 'package:weather_clean_architecture_flutter/core/domain/error/error.dart';

abstract class ErrorToMessageMapper {
  String map(final BaseError error);
}

class ErrorMessageMapperImpl extends ErrorToMessageMapper {
  @override
  String map(final BaseError error) {
    switch (error.runtimeType) {
      case const (NetworkError):
        return "Failed to load data";
      case const (NetworkTimeoutError):
        return "Please check your internet connection";
      case const (ServerError):
        return "Server Error";
      case const (CommonError):
        return "Something went wrong";
      default:
        return "Something went wrong";
    }
  }
}
