import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/home/view/home_view.dart';

class SplashViewModel extends ChangeNotifier {
  void goToHomeView(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.id);
    });
  }
}
