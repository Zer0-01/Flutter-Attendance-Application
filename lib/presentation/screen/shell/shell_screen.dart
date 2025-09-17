import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/routes/app_router.gr.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeSetupRoute(), ProfileSetupRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
