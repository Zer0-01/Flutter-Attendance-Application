import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel extends ChangeNotifier {
  Barcode? barcode;

  void handleBarcode(BarcodeCapture barcodeCapture) {
    barcode = barcodeCapture.barcodes.firstOrNull;
    notifyListeners();
  }
}
