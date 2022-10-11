import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/help_controller.dart';

class HelpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HelpController());
  }
}
