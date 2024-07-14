import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/home/view/home_view.dart';

class SplashViewModel extends ChangeNotifier {
  void goToHomeView(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacementNamed(context, HomeView.id);
    });
  }
}
