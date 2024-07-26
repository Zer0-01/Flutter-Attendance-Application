import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/scanner/view/scanner_view.dart';
import 'package:flutter_attendance_application/utils/date_time_utils.dart';

class SessionViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void init() {
    _setInitialDate();
  }

  void start(BuildContext context) {
    _navigateToScannerView(context);
  }

  void cancel(BuildContext context) {
    _dismiss(context);
  }

  //Private Function
  void _setInitialDate() {
    dateController.text = DateTimeUtils.formatDate(DateTime.now());
    notifyListeners();
  }

  void _navigateToScannerView(BuildContext context) {
    Navigator.pushNamed(context, ScannerView.id);
  }

  void _dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
