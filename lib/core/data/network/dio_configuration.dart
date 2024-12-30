import 'package:dio/dio.dart';

const int _networkTimeoutDurationSeconds = 10;
const String _baseUrl = "https://api.openweathermap.org/data/2.5/";
const String _contentTypeJson = "application/json";

/// Here we could change the baseUrl based on the
/// BuildMode of the app or the Flavor
/// baseUrl: (kDebugMode) ? _stagingUrl : _prodUrl
/// For the sake of simplicity I'm using only the
/// Production url here
BaseOptions configureDio() {
  final options = BaseOptions(
    baseUrl: _baseUrl,
    contentType: _contentTypeJson,
    responseType: ResponseType.json,
    sendTimeout: const Duration(seconds: _networkTimeoutDurationSeconds),
    receiveTimeout: const Duration(seconds: _networkTimeoutDurationSeconds),
  );

  return options;
}
