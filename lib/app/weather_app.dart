import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_flutter/features/current_weather/presentation/screen/current_weather_screen_container.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Current Weather',
      debugShowCheckedModeBanner: false,
      home: CurrentWeatherScreenContainer(),
    );
  }
}
