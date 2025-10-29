import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class PasswordFormWidget extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordFormWidget({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormFieldWidget(
            controller: passwordController,
            hintText: context.l10n.enter_your_password,
            label: Text(context.l10n.password),
          )
        ],
      ),
    );
  }
}
