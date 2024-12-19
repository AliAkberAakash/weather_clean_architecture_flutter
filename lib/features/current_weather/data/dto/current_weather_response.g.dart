// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponse _$CurrentWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherResponse(
      dateTime: (json['dt'] as num).toInt(),
      weatherDetails:
          WeatherDetails.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    );

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) =>
    WeatherDetails(
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      partOfDay: json['pod'] as String,
    );

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      name: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      speed: (json['speed'] as num).toDouble(),
    );
