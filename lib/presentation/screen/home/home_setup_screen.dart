import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_attendance_application/presentation/screen/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeSetupScreen extends StatelessWidget {
  const HomeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    );
  }
}
