import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/scanner/dialog/view/end_session_dialog_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel extends ChangeNotifier {
  Barcode? barcode;
  final player = AudioPlayer();

  void handleBarcode(BarcodeCapture barcodeCapture) {
    barcode = barcodeCapture.barcodes.firstOrNull;
    notifyListeners();
  }

  void cancel(BuildContext context) {
    _dismiss(context);
  }

  void end(BuildContext context) {
    showDialog(context: context, builder: (context) => EndSessionDialogView());
  }

  //private method
  void _dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
