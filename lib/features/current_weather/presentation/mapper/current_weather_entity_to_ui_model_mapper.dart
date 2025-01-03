import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';

abstract class CurrentWeatherEntityToUiModelMapper {
  CurrentWeatherUiModel map(CurrentWeatherEntity entity);
}

const _fullNameFormat = "EEEE";
const _shortNameFormat = "EEE";
const _humidityUnit = "%";
const _pressureUnit = "hPa";
const _windSpeedUnitMetric = "m/s";
const _windSpeedUnitImperial = "mph";
const _imageScalingSmall = "@2x";
const _imageScalingLarge = "@4x";
const _celsiusUnit = "°C";
const _fahrenheitUnit = "°F";
const _imageBaseUrl = "https://openweathermap.org/img/wn/";
const _imageExt = ".png";

class CurrentWeatherEntityToUiModelMapperImpl
    implements CurrentWeatherEntityToUiModelMapper {
  @override
  CurrentWeatherUiModel map(CurrentWeatherEntity entity) {
    return CurrentWeatherUiModel(
      dayNameFull: _getDayNameFromTimeStamp(
        entity.dateTime,
        _fullNameFormat,
      ),
      dayNameShort: _getDayNameFromTimeStamp(
        entity.dateTime,
        _shortNameFormat,
      ),
      temp: "${entity.temp.toStringAsFixed(2)}°",
      tempMin: "${entity.tempMin.toStringAsFixed(2)}°",
      tempMax: "${entity.tempMax.toStringAsFixed(2)}°",
      pressure: "${entity.pressure} $_pressureUnit",
      humidity: "${entity.humidity} $_humidityUnit",
      partOfDay: entity.partOfDay,
      weatherCondition: entity.weather.isNotEmpty ? entity.weather[0].name : "",
      description:
          entity.weather.isNotEmpty ? entity.weather[0].description : "",
      smallIcon: entity.weather.isNotEmpty
          ? _getWeatherImageIcon(entity.weather[0].icon, _imageScalingSmall)
          : "",
      bigIcon: entity.weather.isNotEmpty
          ? _getWeatherImageIcon(entity.weather[0].icon, _imageScalingLarge)
          : "",
      windSpeed: _getWindSpeedWithUnit(entity.speed, entity.unit),
      measurementUnit: entity.unit,
      temperatureUnit: _getMeasurementUnit(entity.unit),
    );
  }

  static String _getWindSpeedWithUnit(double windSpeed, MeasurementUnit unit) {
    final speed = windSpeed.toStringAsFixed(2);
    if (unit == MeasurementUnit.metric) {
      return "$speed $_windSpeedUnitMetric";
    }
    return "$speed $_windSpeedUnitImperial";
  }

  static String _getDayNameFromTimeStamp(int timestamp, String format) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat(format).format(date);
  }

  static String _getWeatherImageIcon(String imageIcon, String imageScaling) {
    return "$_imageBaseUrl$imageIcon$imageScaling$_imageExt";
  }

  static String _getMeasurementUnit(MeasurementUnit measurementUnit) {
    if (measurementUnit == MeasurementUnit.metric) {
      return _celsiusUnit;
    }

    return _fahrenheitUnit;
  }
}
