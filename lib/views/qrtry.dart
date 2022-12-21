import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class Qrtrypage extends StatelessWidget {
  const Qrtrypage({super.key});

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();

    return Scaffold(
        appBar: appBar('QrScanner'),
        body: SingleChildScrollView(
          child: MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  Get.snackbar('Error', 'Could not find',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                } else {
                  final String code = barcode.rawValue!;
                  Get.snackbar('Result', 'Scanned Successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                  debugPrint('Barcode found! $code');
                }
              }),
        ));
  }
}
