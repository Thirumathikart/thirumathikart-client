import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
