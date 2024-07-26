import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel extends ChangeNotifier {
  final MobileScannerController qrController = MobileScannerController();

  StreamSubscription<Object?>? subscription;

  
}