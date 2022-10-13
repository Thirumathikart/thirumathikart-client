import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/services/api_services.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductResponse>> {
  final textController = TextEditingController();
  final productsListDynamic = [].obs;
  final api = Get.find<ApiServices>().api;
  final flag = true
      .obs; //It is true only when the page is opened for the first time, becomes false henceforth
  final isSelected = [true, false].obs;
  @override
  void onReady() {
    getProducts();
    super.onReady();
  }

  Future<void> getProducts() async {
    api.getProducts().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Get.snackbar('Failed To Get Products', 'Check Your Internet Connection');
    });
  }

  void reverse() {
    productsListDynamic(productsListDynamic.reversed.toList());
  }

  void add(List productsList, Product item) {
    productsListDynamic.add(item);
  }

  void empty() {
    productsListDynamic([]);
  }

  void copy(List<Product> productsList) {
    productsListDynamic(productsList);
  }

  int length() => productsListDynamic.length;

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

  void switchFlag() {
    flag(false);
  }
}
