import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';

class WeatherDetailsCubit extends Cubit<CurrentWeatherUiModel?> {
  WeatherDetailsCubit() : super(null);

  void updateWeatherDetails(
      final CurrentWeatherUiModel? weatherDetailsUiModel) {
    emit(weatherDetailsUiModel);
  }
}
