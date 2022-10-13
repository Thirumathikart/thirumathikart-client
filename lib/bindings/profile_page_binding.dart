import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/profile_page_controller.dart';

class ProfilePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}
