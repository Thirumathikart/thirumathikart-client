import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/main.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';
import 'package:thirumathikart_app/views/product_detail.dart';
import 'package:thirumathikart_app/views/products.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductResponse>> {
  final textController = TextEditingController();
  final api = Get.find<ApiServices>().api;
  final storageService = Get.find<StorageServices>();
  final showSnackBar = true.obs;
  final isSelected = [true, false].obs;

  Future<void> getProductsByCategory(
      String category, bool isSorted, String key) async {
    api.getProductsByCategory(storageService, category).then((response) {
      change(sort(response, isSorted, key), status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Get.snackbar('Failed To Get Products', 'Check Your Internet Connection');
    });
  }

  List<ProductResponse> sort(
      List<ProductResponse> response, bool isSorted, String key) {
    if (isSorted) {
      response.sort((a, b) => (double.parse(a.product!.price.toString()))
          .compareTo(double.parse(b.product!.price.toString())));
    } else {
      response.sort((a, b) => double.parse(b.product!.price.toString())
          .compareTo(double.parse(a.product!.price.toString())));
    }
    return filter(response, key);
  }

  List<ProductResponse> filter(
      List<ProductResponse> sortedRespone, String key) {
    List<ProductResponse> filteredResponse = [];
    for (int i = 0; i < sortedRespone.length; i++) {
      if (sortedRespone[i].product!.title!.toLowerCase().contains(key)) {
        filteredResponse.add(sortedRespone[i]);
      }
    }
    if (filteredResponse.isEmpty && showSnackBar.value) {
      Get.snackbar('Search results is empty', 'No matching products found');
      showSnackBar(false);
    }
    if (filteredResponse.isNotEmpty) {
      showSnackBar(true);
    }
    return filteredResponse;
  }

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

 

//    void navigateToProductsPage() {
//   Get.to(() => main());
// }
  
}
