import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/home/widgets/home_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(),
    );
  }
}
