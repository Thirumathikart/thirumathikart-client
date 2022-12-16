import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:thirumathikart_app/controllers/orders_controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
