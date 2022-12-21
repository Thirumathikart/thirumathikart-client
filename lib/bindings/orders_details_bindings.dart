import 'package:get/get.dart';
import 'package:thirumathikart_app/controllers/orders_details_controller.dart';

class OrdersDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersDetailsController());
  }
}
