import 'package:weather_clean_architecture_flutter/core/data/network/network_client.dart';
import 'package:weather_clean_architecture_flutter/core/data/network/network_request.dart';
import 'package:weather_clean_architecture_flutter/env.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/network_source/current_weather_network_source.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/dto/current_weather_response.dart';

class CurrentWeatherNetworkSourceImpl implements CurrentWeatherNetworkSource {
  final NetworkClient _networkClient;

  CurrentWeatherNetworkSourceImpl(
      this._networkClient,
      );

  @override
  Future<List<CurrentWeatherResponse>> getCurrentWeather({
    required final double lat,
    required final double lon,
    required final String units,
  }) async {
    try {
      final networkRequest = NetworkRequest(
        path: "forecast",
        queryParams: {
          "lat": lat.toString(),
          "lon": lon.toString(),
          "appId": apiKey,
          "units": units,
        },
      );
      final response = await _networkClient.get(networkRequest);
      final weatherDataList = response.body["list"];
      final List<CurrentWeatherResponse> weatherList = [];

      for (var weatherData in weatherDataList) {
        weatherList.add(CurrentWeatherResponse.fromJson(weatherData));
      }

      return weatherList;
    } catch (e) {
      rethrow;
    }
  }
}