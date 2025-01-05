import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_flutter/core/domain/error/error.dart';
import 'package:weather_clean_architecture_flutter/core/presentation/mapper/error_to_message_mapper.dart';
import 'package:weather_clean_architecture_flutter/di/di.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/current_weather_bloc/current_weather_bloc.dart';
import 'package:weather_clean_architecture_flutter/core/screen/error_screen.dart';
import 'package:weather_clean_architecture_flutter/core/screen/loading_screen.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/current_weather_bloc/current_weather_event.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/current_weather_bloc/current_weather_state.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/screen/current_weather_screen.dart';

class CurrentWeatherScreenContainer extends StatefulWidget {
  const CurrentWeatherScreenContainer({super.key});

  @override
  State<CurrentWeatherScreenContainer> createState() =>
      _CurrentWeatherScreenContainerState();
}

class _CurrentWeatherScreenContainerState
    extends State<CurrentWeatherScreenContainer> {
  final CurrentWeatherBloc currentWeatherBloc = getIt.get();
  final ErrorToMessageMapper mapper = getIt.get();

  @override
  void initState() {
    _loadWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        bloc: currentWeatherBloc,
        builder: (ctx, state) {
          if (state is CurrentWeatherLoadedState) {
            return CurrentWeatherScreen(
              weatherDetailsUiModelList: state.result,
            );
          } else if (state is CurrentWeatherLoadingState) {
            return const LoadingScreen();
          } else if (state is CurrentWeatherErrorState) {
            return Center(
              child: ErrorScreen(
                errorText: mapper.map(state.error),
                onRetry: _loadWeather,
              ),
            );
          } else {
            return Center(
              child: ErrorScreen(
                errorText: mapper.map(CommonError()),
                onRetry: _loadWeather,
              ),
            );
          }
        },
      ),
    );
  }

  void _loadWeather() {
    currentWeatherBloc.add(
      CurrentWeatherLoadEvent(),
    );
  }
}
