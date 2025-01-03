import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';

class CurrentWeatherUiModel extends Equatable {
  final String dayNameFull;
  final String dayNameShort;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String pressure;
  final String humidity;
  final String partOfDay;
  final String weatherCondition;
  final String description;
  final String smallIcon;
  final String bigIcon;
  final String windSpeed;
  final MeasurementUnit measurementUnit;
  final String temperatureUnit;

  CurrentWeatherUiModel({
    required this.dayNameFull,
    required this.dayNameShort,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.partOfDay,
    required this.weatherCondition,
    required this.description,
    required this.smallIcon,
    required this.bigIcon,
    required this.windSpeed,
    required this.measurementUnit,
    required this.temperatureUnit,
  });

  @override
  List<Object?> get props => [
        dayNameFull,
        dayNameShort,
        temp,
        tempMin,
        tempMax,
        pressure,
        humidity,
        partOfDay,
        weatherCondition,
        description,
        smallIcon,
        bigIcon,
        windSpeed,
        measurementUnit,
        temperatureUnit,
      ];
}
