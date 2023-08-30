import 'package:get/get.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class CartController extends GetxController {
 RxList<ProductResponse> cart = <ProductResponse>[].obs;
  GetStorage box = GetStorage();
  RxDouble grandTotal = 0.0.obs;

  void removeSelectedItemFromCart(int index) {
    cart.removeAt(index);

    List<Map<String, dynamic>> itemscart =
        cart.map((ProductResponse e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);
    box.write('itemscart', jsonString);
  }

  void increaseQtyOfSelectedItemInCart(int index) {
    cart[index].product!.quantity = cart[index].product!.quantity! + 1;

    List<Map<String, dynamic>> itemscart =
        cart.map((ProductResponse e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);

    box.write('itemscart', jsonString);
  }

  void decreaseQtyOfSelectedItemInCart(int index, ProductResponse product) {
    if (product.product!.quantity == 1) {
      cart.removeAt(index);
    } else {
      cart[index].product!.quantity = cart[index].product!.quantity! - 1;
    }
    List<Map<String, dynamic>> itemscart =
        cart.map((ProductResponse e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);

    box.write('itemscart', jsonString);
  }

  void calculateGrandTotal() {
    grandTotal.value = 0;
    for (int i = 0; i < cart.length; i++) {
      double sum =
          cart[i].product!.quantity!.toDouble() * cart[i].product!.price!;
      grandTotal.value = grandTotal.value + sum;
    }
  }

  void updatingSession() {
    box.listenKey('itemscart', (updatedValue) {
      //List itemval = jsonDecode(updatedValue);
      cart.clear();
      // ignore: unnecessary_lambdas

      //cart.addAll(itemval.map((e) => ProductResponse.fromMap(e)).toList());
      calculateGrandTotal();
    });
  }



void getUpdatedSessionCartData() {
  if (box.hasData('itemscart')) {
    String? jsonString = box.read('itemscart');

    if (jsonString != null && jsonString.isNotEmpty) {
      List<dynamic> decodedList = jsonDecode(jsonString);
      List<ProductResponse> cartItems = decodedList
          .map((e) => ProductResponse.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      cart.clear();
      cart.addAll(cartItems);
    }
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
