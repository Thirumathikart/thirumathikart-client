import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thirumathikart_app/models/order_request.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'dart:convert';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class ProductDetailsController extends GetxController {
  final productDynamic = 0.obs;
  RxList<ProductResponse> cart = <ProductResponse>[].obs;
  GetStorage box = GetStorage();
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();

  void addItemToCart(ProductResponse product) {
    cart.add(product);

    List<Map<String, dynamic>> itemscart =
        cart.map((ProductResponse e) => e.toJson()).toList();
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
      //List itemval = jsonDecode(updatedValue);
      cart.clear();
      // ignore: unnecessary_lambdas
      //cart.addAll(itemval.map((e) => ProductResponse.fromMap(e)).toList());
    });
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('itemscart')) {
      //String value = GetStorage().read('itemscart');
      //List itemval = jsonDecode(value);
      cart.clear();
      // ignore: unnecessary_lambdas
      //cart.addAll(itemval.map((e) => ProductResponse.fromMap(e)).toList());
    }

    updatingSession();
  }

  @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }

  void createOrder(OrderRequest orderRequest) async {
    if (productDynamic.value == 0) {
      Get.snackbar('Invalid Order', 'Quantity cannot be zero.');
      return;
    }
    api.createOrder(orderRequest, storage).then((response) {
      Get.snackbar('Order Placed', 'Order Placed Successfully.');
      updateQuantity(0);
    }, onError: (err) {
      Get.snackbar('Failed To Place Order', err.toString());
    });
  }
}
