import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
      child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(context.l10n.login))),
    );
  }
}
