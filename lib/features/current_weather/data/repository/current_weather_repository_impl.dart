import 'package:weather_clean_architecture_flutter/core/data/exceptions/base_exception.dart';
import 'package:weather_clean_architecture_flutter/core/data/mapper/exception_to_error_mapper.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/network_source/current_weather_network_source.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/mapper/current_weather_entity_mapper.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/entity/current_weather_entity.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/repository/current_weather_reository.dart';

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository {
  final CurrentWeatherNetworkSource _weatherNetworkSource;
  final CurrentWeatherEntityMapper _weatherDetailsEntityMapper;
  final ExceptionToErrorMapper _exceptionToErrorMapper;

  CurrentWeatherRepositoryImpl(
    this._weatherNetworkSource,
    this._weatherDetailsEntityMapper,
    this._exceptionToErrorMapper,
  );

  @override
  Future<List<CurrentWeatherEntity>> getCurrentWeather({
    required final double lat,
    required final double lon,
    required final MeasurementUnit units,
  }) async {
    try {
      final response = await _weatherNetworkSource.getCurrentWeather(
        lat: lat,
        lon: lon,
        units: units.name,
      );

      return _weatherDetailsEntityMapper.map(response, units);
    } on BaseException catch (e) {
      final error = _exceptionToErrorMapper.map(e);
      throw error;
    } catch (e) {
      rethrow;
    }
  }
}
