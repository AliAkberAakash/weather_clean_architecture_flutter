import 'package:weather_clean_architecture_flutter/core/data/exceptions/base_exception.dart';

class NetworkException extends BaseException {
  const NetworkException();
}

class NetworkTimeoutException extends BaseException {
  const NetworkTimeoutException();
}

class ServerException extends BaseException {
  final int? statusCode;
  final String? statusMessage;

  const ServerException({
    this.statusCode,
    this.statusMessage,
  });

  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
  ];
}