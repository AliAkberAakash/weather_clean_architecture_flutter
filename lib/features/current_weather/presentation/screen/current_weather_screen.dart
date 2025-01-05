import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_flutter/di/di.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/bloc/weather_details_cubit/weather_details_cubit.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/widget/weather_day_info_widget.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/widget/weather_details_widget.dart';

class CurrentWeatherScreen extends StatefulWidget {
  final List<CurrentWeatherUiModel> weatherDetailsUiModelList;

  const CurrentWeatherScreen({
    super.key,
    required this.weatherDetailsUiModelList,
  });

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  final WeatherDetailsCubit weatherDetailsCubit = getIt.get();

  @override
  void initState() {
    weatherDetailsCubit
        .updateWeatherDetails(widget.weatherDetailsUiModelList.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: BlocBuilder<WeatherDetailsCubit, CurrentWeatherUiModel?>(
              bloc: weatherDetailsCubit,
              builder: (ctx, state) {
                if (state != null) {
                  return WeatherDetailsWidget(
                    currentWeatherUiModel: state,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.weatherDetailsUiModelList.length,
              itemBuilder: (BuildContext context, int index) {
                final currentWeatherUiModel =
                    widget.weatherDetailsUiModelList[index];
                return WeatherDayInfoWidget(
                  currentWeatherUiModel: currentWeatherUiModel,
                  onTap: () {
                    weatherDetailsCubit.updateWeatherDetails(
                      currentWeatherUiModel,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
