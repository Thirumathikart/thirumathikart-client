import 'package:get/instance_manager.dart';
import 'package:thirumathikart_app/controllers/products_controller.dart';

class ProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
  }
}
