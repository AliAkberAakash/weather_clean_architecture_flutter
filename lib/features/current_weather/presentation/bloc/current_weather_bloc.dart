import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_flutter/core/domain/error/error.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/domain/repository/current_weather_reository.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/current_weather_event.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/current_weather_state.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/mapper/current_weather_entity_to_ui_model_mapper.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final CurrentWeatherRepository repository;
  final CurrentWeatherEntityToUiModelMapper uiModelMapper;

  CurrentWeatherBloc(
    this.repository,
    this.uiModelMapper,
  ) : super(CurrentWeatherLoadingState()) {
    on<CurrentWeatherLoadEvent>(_onCurrentWeatherLoadHandler);
  }

  FutureOr<void> _onCurrentWeatherLoadHandler(
    final CurrentWeatherLoadEvent event,
    final Emitter<CurrentWeatherState> emit,
  ) async {
    emit(CurrentWeatherLoadingState());
    try {
      final entityList = await repository.getCurrentWeather(
        lat: event.lat,
        lon: event.lon,
        units: event.units,
      );
      final uiModelList = entityList
          .map(
            (entity) => uiModelMapper.map(entity),
          )
          .toList();

      emit(CurrentWeatherLoadedState(uiModelList));
    } on BaseError catch (e) {
      emit(
        CurrentWeatherErrorState(
          error: e,
        ),
      );
    } catch (e) {
      emit(
        CurrentWeatherErrorState(
          error: CommonError(),
        ),
      );
    }
  }
}
