import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final productDynamic = 0.obs;

  void updateQuantity(int quantity) {
    productDynamic(quantity);
  }
}
