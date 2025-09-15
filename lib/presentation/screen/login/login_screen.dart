import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/email_form_widget.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [EmailFormWidget(), PasswordFormWidget()],
        ),
      ),
    );
  }
}
