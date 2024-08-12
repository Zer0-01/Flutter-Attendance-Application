import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/scanner/dialog/end_session_dialog/view_model/end_session_dialog_view_model.dart';
import 'package:flutter_attendance_application/features/scanner/widget/scanner_elevated_button_widget.dart';
import 'package:flutter_attendance_application/res/app_colors.dart';

class EndSessionDialogView extends StatefulWidget {
  const EndSessionDialogView({super.key});

  @override
  State<EndSessionDialogView> createState() => _EndSessionDialogViewState();
}

class _EndSessionDialogViewState extends State<EndSessionDialogView> {
  EndSessionDialogViewModel vm = EndSessionDialogViewModel();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('End Session Confirmation'),
      content: const Text('Are you sure you want to end the session?'),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      actions: <Widget>[
        ScannerElevatedButtonWidget(
          label: 'Cancel',
          borderColor: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: AppColors.primaryColor,
          onPressed: () {
            vm.cancel(context);
          },
        ),
        ScannerElevatedButtonWidget(
          label: 'End',
          borderColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
