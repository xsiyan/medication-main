import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medication/constants/appstyle_bloodpressure.dart';

class HealthSugarText extends StatelessWidget {
  final String sugar;

  const HealthSugarText({
    required this.sugar,
  });

  @override
  Widget build(BuildContext context) {
    return determineHealthStatus(
      sugar,
    );
  }

  Text determineHealthStatus(String sugar) {
    int value = int.tryParse(sugar) ?? 0;

    if (value >= 50 && value <= 149) {
      return const Text(
        "Normal",
        style: TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to green
      );
    } else if (value >= 150 && value <= 214) {
      return const Text(
        "Impaired Glucose",
        style: TextStyle(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to blue
      );
    } else if (value >= 215 && value <= 380) {
      return const Text(
        "Diabetic",
        style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to orange
      );
    } else {
      return const Text(
        "Invalid value",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ), // Set font color to black
      );
    }
  }
}
