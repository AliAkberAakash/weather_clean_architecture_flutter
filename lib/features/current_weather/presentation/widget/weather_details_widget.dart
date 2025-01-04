import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/widget/weather_info_line_widget.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final CurrentWeatherUiModel currentWeatherUiModel;

  const WeatherDetailsWidget({
    super.key,
    required this.currentWeatherUiModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          currentWeatherUiModel.dayNameFull,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          currentWeatherUiModel.weatherCondition,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Image.network(
          currentWeatherUiModel.smallIcon,
        ),
        Text(
          currentWeatherUiModel.temp,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        Column(
          children: [
            WeatherInfoLineWidget(
              property: "Humidity",
              value: currentWeatherUiModel.humidity,
            ),
            WeatherInfoLineWidget(
              property: "Pressure",
              value: currentWeatherUiModel.pressure,
            ),
            WeatherInfoLineWidget(
              property: "Wind",
              value: currentWeatherUiModel.windSpeed,
            ),
          ],
        ),
      ],
    );
  }
}
