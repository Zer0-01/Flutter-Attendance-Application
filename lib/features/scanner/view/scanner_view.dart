import 'package:flutter/material.dart';

class ScannerView extends StatefulWidget {
  static const String id = 'scanner_view';

  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
