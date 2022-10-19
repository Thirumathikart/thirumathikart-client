import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
