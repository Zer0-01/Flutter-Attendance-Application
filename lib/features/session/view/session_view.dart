import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/session/view_model/session_view_model.dart';
import 'package:flutter_attendance_application/features/session/widget/session_elevated_button_widget.dart';
import 'package:flutter_attendance_application/features/session/widget/session_text_form_field_widget.dart';
import 'package:flutter_attendance_application/res/app_colors.dart';
import 'package:provider/provider.dart';

class SessionView extends StatefulWidget {
  static const String id = 'session_view';

  const SessionView({super.key});

  @override
  State<SessionView> createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  SessionViewModel vm = SessionViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<SessionViewModel>(
        create: (context) => vm,
        child: Consumer<SessionViewModel>(
          builder: (context, vm, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SessionTextFormFieldWidget(
                      labelText: 'Title',
                      validator: mandatoryValidator,
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SessionElevatedButtonWidget(
                              label: 'Cancel',
                              backgroundColor: AppColors.secondaryColor,
                              foregroundColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              onPressed: () {
                                vm.cancel(context);
                              }),
                        ),
                        const SizedBox(width: 32.0),
                        Expanded(
                          child: SessionElevatedButtonWidget(
                              label: 'Start',
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.secondaryColor,
                              borderColor: AppColors.primaryColor,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  vm.start(context);
                                } 
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String? mandatoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
