import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class EmailFormWidget extends StatelessWidget {
  const EmailFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.email,
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppTextFormFieldWidget(
            hintText: context.l10n.enter_your_email_address,
          )
        ],
      ),
    );
  }
}
