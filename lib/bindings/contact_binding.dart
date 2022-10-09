import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/contact_controller.dart';

class ContactBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
