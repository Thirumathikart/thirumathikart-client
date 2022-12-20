import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  var qrCode = ''.obs;
  String scannedQrcode = '';
  Future<void> scanQR() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
          'ff6666', 'Cancel', true, ScanMode.QR);
      if (scannedQrcode != '-1') {
        Get.snackbar('Result', scannedQrcode,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      }
    } on PlatformException {
      Get.snackbar('Error', 'Could not find',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
