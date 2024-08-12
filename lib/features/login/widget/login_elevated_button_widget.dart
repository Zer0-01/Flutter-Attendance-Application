import 'package:flutter/material.dart';

class LoginElevatedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const LoginElevatedButtonWidget(
      {super.key,
      this.onPressed,
      required this.label,
      this.backgroundColor,
      this.foregroundColor,
      required this.borderColor,
      this.padding,
      this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: padding,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(color: borderColor),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      child: child,
    );
  }
}
