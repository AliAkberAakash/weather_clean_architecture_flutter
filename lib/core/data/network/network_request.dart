import 'package:equatable/equatable.dart';

class NetworkRequest extends Equatable {
  final String path;
  final Map<String, dynamic>? requestBody;
  final Map<String, dynamic>? queryParams;
  final Map<String, dynamic>? headers;

  const NetworkRequest({
    required this.path,
    this.requestBody,
    this.queryParams,
    this.headers,
  });

  @override
  List<Object?> get props => [
    path,
    requestBody,
    queryParams,
    headers,
  ];
}