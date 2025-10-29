import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/configuration/app_secure_storage.dart';
import 'package:flutter_attendance_application/data/repository/auth_repository.dart';
import 'package:flutter_attendance_application/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_attendance_application/presentation/screen/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginSetupScreen extends StatelessWidget {
  const LoginSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          authRepository: AuthRepository(),
          appSecureStorage: AppSecureStorage()),
      child: const LoginScreen(),
    );
  }
}
