import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medication/constants/appstyle_bloodpressure.dart';

class HealthStatusText extends StatelessWidget {
  final String diastolic;
  final String systolic;

  const HealthStatusText({
    super.key,
    required this.diastolic,
    required this.systolic,
  });

  @override
  Widget build(BuildContext context) {
    return determineHealthStatus(diastolic, systolic);
  }

  Text determineHealthStatus(
      String diastolicController, String systolicController) {
    int value = int.tryParse(diastolicController) ?? 0;
    int valueSys = int.tryParse(systolicController) ?? 0;

    if (value >= 1 && value <= 89 || valueSys >= 1 && valueSys <= 119) {
      return const Text(
        "Low",
        style: TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to green
      );
    } else if (value >= 90 && value <= 119 ||
        valueSys >= 90 && valueSys <= 119) {
      return const Text(
        "Normal",
        style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to blue
      );
    } else if (value >= 120 && value <= 139 ||
        valueSys >= 120 && valueSys <= 139) {
      return const Text(
        "Hypertension Stage 1",
        style: TextStyle(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to orange
      );
    } else if (value >= 140 && value <= 159 ||
        valueSys >= 140 && valueSys <= 159) {
      return const Text(
        "Hypertension Stage 2",
        style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to red
      );
    } else if (value >= 160 && value <= 500 ||
        valueSys >= 160 && valueSys <= 500) {
      return const Text(
        "Hypertensive Crisis",
        style: TextStyle(
            color: Colors.purple,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to purple
      );
    } else {
      return const Text(
        "Invalid value",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800), // Set font color to black
      );
    }
  }
}
