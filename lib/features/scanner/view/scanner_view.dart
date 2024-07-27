import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/scanner/view_model/scanner_view_model.dart';
import 'package:flutter_attendance_application/res/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider<ScannerViewModel>(
        create: (context) => vm,
        child: Consumer<ScannerViewModel>(
          builder: (context, vm, child) {
            return Stack(
              children: [
                MobileScanner(
                  onDetect: (barcodes) {
                    vm.handleBarcode(barcodes);
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.black.withOpacity(0.4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          vm.barcode?.displayValue ?? "Scan Something",
                          style: const TextStyle(color: AppColors.secondaryColor),
                        ),
                        ElevatedButton(onPressed: () {}, child: const Text('Save')),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          child: Stack(
            children: [
              MobileScanner(
                onDetect: (barcodes) {
                  vm.handleBarcode(barcodes);
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.black.withOpacity(0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        vm.barcode?.displayValue ?? "Scan Something",
                        style: const TextStyle(color: AppColors.secondaryColor),
                      ),
                      ElevatedButton(onPressed: () {}, child: const Text('Save')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
