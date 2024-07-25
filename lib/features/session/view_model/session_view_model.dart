import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionViewModel extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  DateTime? date;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  void init() {
    dateController.text = dateFormat.format(DateTime.now());

    notifyListeners();
  }

  Future<void> displayDatePicker(BuildContext context) async {
    DateTime selected = DateTime.now();
    DateTime initial = DateTime(2000);
    DateTime last = DateTime.now();
    date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      dateController.text = dateFormat.format(date!);
    }
    notifyListeners();
  }

  Future<void> startSession() async {}
}
