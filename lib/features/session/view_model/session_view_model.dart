import 'package:flutter/material.dart';

class SessionViewModel extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();

  Future<void> displayDatePicker(BuildContext context) async {
    DateTime selected = DateTime.now();
    DateTime initial = DateTime(2000);
    DateTime last = DateTime(2025);
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      dateController.text = date.toString();
      notifyListeners();
    }
    notifyListeners();
  }
}
