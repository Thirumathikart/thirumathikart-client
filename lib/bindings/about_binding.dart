import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/about_controller.dart';

class AboutBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}
