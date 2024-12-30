import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_clean_architecture_flutter/core/data/mapper/exception_to_error_mapper.dart';
import 'package:weather_clean_architecture_flutter/core/data/network/dio_configuration.dart';
import 'package:weather_clean_architecture_flutter/core/data/network/dio_network_client.dart';
import 'package:weather_clean_architecture_flutter/core/data/network/network_client.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/mapper/current_weather_entity_mapper.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/mapper/current_weather_entity_mapper_impl.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/network_source/current_weather_network_source.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/network_source/current_weather_network_source_impl.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/data/repository/current_weather_repository_impl.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/repository/current_weather_reository.dart';

final getIt = GetIt.I;

Future<void> setup() async {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      configureDio(),
    ),
  );
  getIt.registerLazySingleton<NetworkClient>(
    () => DioNetworkClient(
      getIt.get(),
    ),
  );
  getIt.registerLazySingleton<CurrentWeatherNetworkSource>(
    () => CurrentWeatherNetworkSourceImpl(
      getIt.get(),
    ),
  );
  getIt.registerLazySingleton<ExceptionToErrorMapper>(
    () => ExceptionToErrorMapperImpl(),
  );
  getIt.registerLazySingleton<CurrentWeatherEntityMapper>(
    () => CurrentWeatherEntityMapperImpl(),
  );
  getIt.registerLazySingleton<CurrentWeatherRepository>(
    () => CurrentWeatherRepositoryImpl(
      getIt.get(),
      getIt.get(),
      getIt.get(),
    ),
  );
}
