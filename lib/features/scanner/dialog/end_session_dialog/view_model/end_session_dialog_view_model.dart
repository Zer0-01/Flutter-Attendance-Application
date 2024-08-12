import 'package:flutter/material.dart';

class EndSessionDialogViewModel extends ChangeNotifier {

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }
}
