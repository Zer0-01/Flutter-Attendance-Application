import 'package:flutter/material.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final String? hintText;

  const AppTextFormFieldWidget({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        border: _getBorder(),
        focusedBorder: _getFocusedBorder(),
      ),
    );
  }

  InputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }

  InputBorder _getFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
