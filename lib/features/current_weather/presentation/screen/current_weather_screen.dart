import 'package:flutter/material.dart';
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
  State<CurrentWeatherScreen> createState() =>
      _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState
    extends State<CurrentWeatherScreen> {

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
            child: WeatherDetailsWidget(
              currentWeatherUiModel: widget.weatherDetailsUiModelList.first,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.weatherDetailsUiModelList.length,
              itemBuilder: (BuildContext context, int index) {
                return WeatherDayInfoWidget(
                  currentWeatherUiModel: widget.weatherDetailsUiModelList[index],
                  onTap: (){
                    //todo: implement later
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
