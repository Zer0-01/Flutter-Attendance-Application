import 'package:flutter/material.dart';

class ScannerElevatedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  const ScannerElevatedButtonWidget(
      {super.key,
      this.onPressed,
      required this.label,
      this.backgroundColor,
      this.foregroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(color: borderColor),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(label),
    );
  }
}
