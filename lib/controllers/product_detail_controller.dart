import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'dart:convert';

class ProductDetailsController extends GetxController {
  final productDynamic = 0.obs;
  RxList<Product> cart = <Product>[].obs;
  GetStorage box = GetStorage();

  void addItemToCart(Product product) {
    cart.add(product);

    List<Map<String, dynamic>> itemscart =
        cart.map((Product e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);
    box.write('itemscart', jsonString).then((value) => {
          Get.snackbar('Message', 'Added to Cart.',
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
              backgroundColor: AppTheme.facebook,
              snackPosition: SnackPosition.TOP)
        });
  }

  void updateQuantity(int quantity) {
    productDynamic(quantity);
  }

  void updatingSession() {
    box.listenKey('itemscart', (updatedValue) {
      List itemval = jsonDecode(updatedValue);
        cart.clear();
        cart.addAll(itemval.map((e) => Product.fromMap(e)).toList());
    });
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('itemscart')) {
      String value = GetStorage().read('itemscart');
     List itemval = jsonDecode(value);
        cart.clear();
        cart.addAll(itemval.map((e) => Product.fromMap(e)).toList());
    }

    updatingSession();
  }

  @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }
}
