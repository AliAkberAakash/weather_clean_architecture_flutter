import 'package:weather_clean_architecture_flutter/features/current_weather/data/dto/current_weather_response.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';

abstract class CurrentWeatherEntityMapper {
  List<CurrentWeatherEntity> map(
    final List<CurrentWeatherResponse> responseList,
    final MeasurementUnit units,
  );
}
