import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/qr_controller.dart';

class QrBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(QrController());
  }
}
