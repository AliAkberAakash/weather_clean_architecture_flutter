class CurrentWeatherEntity {
  final int dateTime;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final String partOfDay;
  final List<WeatherEntity> weather;
  final double speed;
  final MeasurementUnit unit;

  const CurrentWeatherEntity({
    required this.dateTime,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.partOfDay,
    required this.weather,
    required this.speed,
    required this.unit,
  });
}

class WeatherEntity {
  final String name;
  final String description;
  final String icon;

  const WeatherEntity({
    required this.name,
    required this.description,
    required this.icon,
  });
}

enum MeasurementUnit {
  metric,
  imperial,
}