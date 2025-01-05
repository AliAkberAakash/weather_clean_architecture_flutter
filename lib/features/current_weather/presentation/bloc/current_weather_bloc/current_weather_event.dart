import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';

abstract class CurrentWeatherEvent extends Equatable {}

class CurrentWeatherLoadEvent extends CurrentWeatherEvent {
  final double lat;
  final double lon;
  final MeasurementUnit units;

  CurrentWeatherLoadEvent({
    this.lat = 25.2637,
    this.lon = 57.5759,
    this.units = MeasurementUnit.metric,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
        units,
      ];
}
