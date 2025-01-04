import 'package:flutter/material.dart';

class WeatherInfoLineWidget extends StatelessWidget {
  final String property;
  final String value;

  const WeatherInfoLineWidget({
    super.key,
    required this.property,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text(
          "$property: $value",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
