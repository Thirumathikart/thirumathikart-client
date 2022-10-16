import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/product_detail_controller.dart';

class ProductDetialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController());
  }
}
