import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/feedback_controller.dart';

class FeedbackBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FeedbackController());
  }
}
