import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButtonWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
      child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: _isEnabled(
                      emailController: emailController,
                      passwordController: passwordController)
                  ? () {}
                  : null,
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(context.l10n.login))),
    );
  }

  bool _isEnabled({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
