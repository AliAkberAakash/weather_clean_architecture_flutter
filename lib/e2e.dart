import 'package:weather_clean_architecture_flutter/di/di.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/repository/current_weather_reository.dart';

void main() async {
  await setup();
  final CurrentWeatherRepository repository = getIt.get();

  final result = await repository.getCurrentWeather(
    lat: 20.3,
    lon: 14.9,
    units: MeasurementUnit.metric,
  );

  print(result);
}
