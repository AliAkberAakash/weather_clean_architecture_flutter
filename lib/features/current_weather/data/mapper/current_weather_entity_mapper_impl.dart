import 'package:weather_clean_architecture_flutter/features/current_weather/data/dto/current_weather_response.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/mapper/current_weather_entity_mapper.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';

class CurrentWeatherEntityMapperImpl extends CurrentWeatherEntityMapper {
  @override
  List<CurrentWeatherEntity> map(
    final List<CurrentWeatherResponse> responseList,
    final MeasurementUnit units,
  ) {
    final entityList = responseList
        .map(
          (response) => _mapFromWeatherResponse(
            response,
            units,
          ),
        )
        .toList();

    return _filterFirstWeatherDetailsPerDay(entityList);
  }

  CurrentWeatherEntity _mapFromWeatherResponse(
    final CurrentWeatherResponse response,
    final MeasurementUnit unit,
  ) {
    return CurrentWeatherEntity(
      dateTime: response.dateTime,
      temp: response.weatherDetails.temp,
      tempMin: response.weatherDetails.tempMin,
      tempMax: response.weatherDetails.tempMax,
      pressure: response.weatherDetails.pressure,
      humidity: response.weatherDetails.humidity,
      partOfDay: response.sys.partOfDay,
      weather: response.weather
          .map((response) => _mapFromWeather(response))
          .toList(),
      speed: response.wind.speed,
      unit: unit,
    );
  }

  WeatherEntity _mapFromWeather(
    final Weather response,
  ) {
    return WeatherEntity(
      name: response.name,
      description: response.description,
      icon: response.icon,
    );
  }

  List<CurrentWeatherEntity> _filterFirstWeatherDetailsPerDay(
    final List<CurrentWeatherEntity> weatherDetails,
  ) {
    Map<String, CurrentWeatherEntity> firstWeatherDetailsPerDay = {};

    for (var entity in weatherDetails) {
      DateTime date =
          DateTime.fromMillisecondsSinceEpoch(entity.dateTime * 1000);
      String dayKey = "${date.year}-${date.month}-${date.day}";

      if (!firstWeatherDetailsPerDay.containsKey(dayKey)) {
        firstWeatherDetailsPerDay[dayKey] = entity;
      }
    }

    return firstWeatherDetailsPerDay.values.toList();
  }
}
