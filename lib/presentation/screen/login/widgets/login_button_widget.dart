import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_attendance_application/utils/animation_constant.dart';
import 'package:flutter_attendance_application/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButtonWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postLoginStatus != current.postLoginStatus,
      listener: (context, state) {
        if (state.postLoginStatus == PostLoginStatus.loading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Center(
                child: LottieBuilder.asset(AnimationConstant.animationLoading),
              );
            },
          );
        }

        if (state.postLoginStatus == PostLoginStatus.success) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
        child: SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: _isEnabled(
                        emailController: emailController,
                        passwordController: passwordController)
                    ? () {
                        context.read<LoginBloc>().add(OnPressedLoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
                    : null,
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(context.l10n.login))),
      ),
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
