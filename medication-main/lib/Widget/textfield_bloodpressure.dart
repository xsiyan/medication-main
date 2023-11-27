import 'package:flutter/material.dart';

class TextFieldBloodPressure extends StatelessWidget {
  const TextFieldBloodPressure({
    super.key,
    required this.maxLines,
    required this.hintText,
    required this.txtController,
  });

  final String hintText;
  final int maxLines;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: txtController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText),
          maxLines: maxLines,
        ));
  }
}
