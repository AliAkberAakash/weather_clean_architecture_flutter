import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather_response.g.dart';

@JsonSerializable(createToJson: false)
class CurrentWeatherResponse extends Equatable {
  @JsonKey(name: 'dt')
  final int dateTime;
  @JsonKey(name: 'main')
  final WeatherDetails weatherDetails;
  @JsonKey(name: 'weather')
  final List<Weather> weather;
  @JsonKey(name: 'wind')
  final Wind wind;
  @JsonKey(name: 'sys')
  final Sys sys;

  const CurrentWeatherResponse({
    required this.dateTime,
    required this.weatherDetails,
    required this.weather,
    required this.wind,
    required this.sys,
  });

  factory CurrentWeatherResponse.fromJson(final Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);

  @override
  List<Object?> get props => [
    dateTime,
    weatherDetails,
    weather,
    wind,
    sys,
  ];
}

@JsonSerializable(createToJson: false)
class WeatherDetails extends Equatable {
  @JsonKey(name: 'temp')
  final double temp;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  @JsonKey(name: 'pressure')
  final int pressure;
  @JsonKey(name: 'humidity')
  final int humidity;

  const WeatherDetails({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherDetails.fromJson(final Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);

  @override
  List<Object?> get props => [
    tempMin,
    tempMax,
    pressure,
    humidity,
  ];
}

@JsonSerializable(createToJson: false)
class Sys extends Equatable {
  @JsonKey(name: 'pod')
  final String partOfDay;

  const Sys({
    required this.partOfDay,
  });

  @override
  List<Object?> get props => [partOfDay];

  factory Sys.fromJson(final Map<String, dynamic> json) => _$SysFromJson(json);
}

@JsonSerializable(createToJson: false)
class Weather extends Equatable {
  @JsonKey(name: 'main')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'icon')
  final String icon;

  const Weather({
    required this.name,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    icon,
  ];

  factory Weather.fromJson(final Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable(createToJson: false)
class Wind extends Equatable {
  @JsonKey(name: "speed")
  final double speed;

  const Wind({
    required this.speed,
  });

  @override
  List<Object?> get props => [speed];

  factory Wind.fromJson(final Map<String, dynamic> json) =>
      _$WindFromJson(json);
}
