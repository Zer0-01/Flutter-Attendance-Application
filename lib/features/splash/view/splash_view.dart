import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/splash/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  static const String id = 'splash_view';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.goToHomeView(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
