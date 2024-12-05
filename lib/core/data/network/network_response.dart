import 'package:equatable/equatable.dart';

class NetworkResponse extends Equatable {
  final Map<String, dynamic> body;
  final Map<String, List<String>> headers;

  const NetworkResponse({required this.body, required this.headers});

  @override
  List<Object?> get props => [
    body,
    headers,
  ];
}
