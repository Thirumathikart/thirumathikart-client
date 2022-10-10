import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final item = 0.obs;
  void updateQuantity(int qty) {
    item(qty);
  }
}
