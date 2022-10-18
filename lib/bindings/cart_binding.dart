import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
