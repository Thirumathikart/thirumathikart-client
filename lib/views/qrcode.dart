import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/controllers/qr_controller.dart';

class Qrpage extends GetView<QrController> {
  const Qrpage({super.key});

  @override
  Widget build(BuildContext context) {
    final qrcontroller = Get.find<QrController>();
    return SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: qrcontroller.scanQR, child: const Text('Scan QR')),
          ],
        ));
  }
}
