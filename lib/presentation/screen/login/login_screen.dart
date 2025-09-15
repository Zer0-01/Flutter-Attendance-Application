import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/email_form_widget.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/password_form_widget.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: const SafeArea(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailFormWidget(),
            PasswordFormWidget(),
            LoginButtonWidget()
          ],
        ),
      ),
    );
  }
}
