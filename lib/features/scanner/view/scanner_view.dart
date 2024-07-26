import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/scanner/view_model/scanner_view_model.dart';

class ScannerView extends StatefulWidget {
  static const String id = 'scanner_view';

  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  ScannerViewModel vm = ScannerViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
