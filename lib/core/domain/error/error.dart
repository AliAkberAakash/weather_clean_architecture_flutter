import 'package:equatable/equatable.dart';

sealed class BaseError extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkError extends BaseError {}

class NetworkTimeoutError extends BaseError {}

class ServerError extends BaseError {
  final int? statusCode;
  final String? statusMessage;

  ServerError({
    this.statusCode,
    this.statusMessage,
  });

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
      ];
}

class CommonError extends BaseError {}
