import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_flutter/di/di.dart';

import 'app/weather_app.dart';

void main() async {
  await setup();
  runApp(const WeatherApp());
}
