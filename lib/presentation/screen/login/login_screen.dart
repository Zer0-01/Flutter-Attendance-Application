import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/email_form_widget.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_attendance_application/presentation/screen/login/widgets/password_form_widget.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(_onChanged);
    _passwordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailFormWidget(
              emailController: _emailController,
            ),
            PasswordFormWidget(
              passwordController: _passwordController,
            ),
            LoginButtonWidget(),
          ],
        ),
      ),
    );
  }
}
