import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture_flutter/core/domain/error/error.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';

sealed class CurrentWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CurrentWeatherLoadingState extends CurrentWeatherState {}

final class CurrentWeatherLoadedState extends CurrentWeatherState {
  final List<CurrentWeatherUiModel> result;

  CurrentWeatherLoadedState(this.result);

  @override
  List<Object?> get props => [result];
}

final class CurrentWeatherErrorState extends CurrentWeatherState {
  final BaseError error;

  CurrentWeatherErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
