import 'package:get/get.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class CartController extends GetxController {
  RxList<Product> cart = <Product>[].obs;
  GetStorage box = GetStorage();
  RxDouble grandTotal = 0.0.obs;

  void removeSelectedItemFromCart(int index) {
    cart.removeAt(index);

    List<Map<String, dynamic>> itemscart =
        cart.map((Product e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);
    box.write('itemscart', jsonString);
  }

  void increaseQtyOfSelectedItemInCart(int index) {
    cart[index].quantity = cart[index].quantity! + 1;

    List<Map<String, dynamic>> itemscart =
        cart.map((Product e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);

    box.write('itemscart', jsonString);
  }

  void decreaseQtyOfSelectedItemInCart(int index, Product product) {
    if (product.quantity == 1) {
      cart.removeAt(index);
    } else {
      cart[index].quantity = cart[index].quantity! - 1;
    }
    List<Map<String, dynamic>> itemscart =
        cart.map((Product e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);

    box.write('itemscart', jsonString);
  }

  void calculateGrandTotal() {
    grandTotal.value = 0;
    for (int i = 0; i < cart.length; i++) {
      double sum = cart[i].quantity!.toDouble() * cart[i].price!;
      grandTotal.value = grandTotal.value + sum;
    }
  }

  void updatingSession() {
    box.listenKey('itemscart', (updatedValue) {
      List itemval = jsonDecode(updatedValue);
      cart.clear();
      // ignore: unnecessary_lambdas
      cart.addAll(itemval.map((e) => Product.fromMap(e)).toList());
      calculateGrandTotal();
    });
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('itemscart')) {
      String value = GetStorage().read('itemscart');
      List itemval = jsonDecode(value);
      cart.clear();
      // ignore: unnecessary_lambdas
      cart.addAll(itemval.map((e) => Product.fromMap(e)).toList());
      calculateGrandTotal();
    }
    updatingSession();
  }

  @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }

  void transactionCompleted() {
    String setval = '[]';
    box.write('itemscart', setval).then((value) {
      grandTotal.value = 0;
      cart.clear();
      Get.back();
      Get.snackbar('Message', 'Order Placed',
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          backgroundColor: const Color(0xff4D4D4D),
          snackPosition: SnackPosition.TOP);
    });
  }
}
