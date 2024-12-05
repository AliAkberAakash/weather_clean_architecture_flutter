import 'package:weather_clean_architecture_flutter/core/data/network/network_request.dart';
import 'package:weather_clean_architecture_flutter/core/data/network/network_response.dart';

abstract class NetworkClient {
  Future<NetworkResponse> get(final NetworkRequest request);
}
