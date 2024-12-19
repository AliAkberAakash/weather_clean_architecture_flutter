import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';

abstract class CurrentWeatherRepository {
  Future<List<CurrentWeatherEntity>> getCurrentWeather({
    required final double lat,
    required final double lon,
    required final MeasurementUnit units,
  });
}