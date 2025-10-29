import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class EmailFormWidget extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormFieldWidget(
            controller: emailController,
            hintText: context.l10n.john_doe_email,
            label: Text(context.l10n.email),
          )
        ],
      ),
    );
  }
}
