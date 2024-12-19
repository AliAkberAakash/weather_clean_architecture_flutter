import 'package:weather_clean_architecture_flutter/features/current_weather/data/dto/current_weather_response.dart';

abstract class CurrentWeatherNetworkDataSource {
  Future<List<CurrentWeatherResponse>> getWeatherResponse({
    required final double lat,
    required final double lon,
    required final String units,
  });
}