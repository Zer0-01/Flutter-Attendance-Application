import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/data/remote/response/api_status.dart';
import 'package:flutter_attendance_application/features/login/view_model/login_view_model.dart';
import 'package:flutter_attendance_application/features/login/widget/login_elevated_button_widget.dart';
import 'package:flutter_attendance_application/features/login/widget/login_text_form_field_widget.dart';
import 'package:flutter_attendance_application/res/app_colors.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel vm = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<LoginViewModel>(
        builder: (context, vm, child) {
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
                            onPressed:
                                vm.userResponse?.status == ApiStatus.LOADING
                                    ? null
                                    : () {
                                        vm.login(context);
                                      },
                            padding: const EdgeInsets.all(16.0),
                            label: vm.userResponse?.status == ApiStatus.LOADING
                                ? 'Loading'
                                : 'Login',
                            borderColor: AppColors.primaryColor,
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.secondaryColor,
                            child: vm.userResponse?.status == ApiStatus.LOADING
                                ? const CircularProgressIndicator(
                                    color: AppColors.secondaryColor,
                                  )
                                : const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
