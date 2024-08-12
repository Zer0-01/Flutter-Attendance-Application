import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/login/widget/login_elevated_button_widget.dart';
import 'package:flutter_attendance_application/features/login/widget/login_text_form_field_widget.dart';
import 'package:flutter_attendance_application/res/app_colors.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginTextFormFieldWidget(labelText: 'Email'),
              const SizedBox(
                height: 24,
              ),
              const LoginTextFormFieldWidget(labelText: 'Password'),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const Text('Forgot Password?'),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: LoginElevatedButtonWidget(
                      onPressed: () {},
                      padding: const EdgeInsets.all(16.0),
                      label: 'Login',
                      borderColor: AppColors.primaryColor,
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
