import 'package:flutter/material.dart';

class SessionTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  const SessionTextFormFieldWidget(
      {super.key, required this.labelText, this.controller, this.validator, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
