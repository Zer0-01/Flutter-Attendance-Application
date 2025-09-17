import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.primary,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.pink,
        ),
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Anas Zulkifli",
            style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onPrimary),
          ),
          Text(
            "Software Engineer",
            style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onPrimary),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
