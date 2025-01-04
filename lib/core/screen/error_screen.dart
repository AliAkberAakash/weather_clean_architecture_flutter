import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorText;
  final void Function() onRetry;

  const ErrorScreen({
    super.key,
    required this.errorText,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorText,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        MaterialButton(
          onPressed: onRetry,
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
