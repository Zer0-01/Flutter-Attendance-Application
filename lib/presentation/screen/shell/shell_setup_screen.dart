import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/shell/shell_screen.dart';

@RoutePage()
class ShellSetupScreen extends StatelessWidget {
  const ShellSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShellScreen();
  }
}
