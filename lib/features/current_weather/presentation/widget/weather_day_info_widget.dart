import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/model/current_weather_ui_model.dart';

class WeatherDayInfoWidget extends StatelessWidget {
  final CurrentWeatherUiModel currentWeatherUiModel;
  final void Function() onTap;

  const WeatherDayInfoWidget({
    super.key,
    required this.currentWeatherUiModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  currentWeatherUiModel.dayNameShort,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Image.network(
                  currentWeatherUiModel.smallIcon,
                ),
                Text(
                  "${currentWeatherUiModel.tempMax}/${currentWeatherUiModel.tempMax}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
