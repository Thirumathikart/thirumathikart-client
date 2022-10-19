import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/product.dart';

class ProductsController extends GetxController {
  final textController = TextEditingController();
  final productsListDynamic = [].obs;
  final flag = true
      .obs; //It is true only when the page is opened for the first time, becomes false henceforth
  final isSelected = [true, false].obs;

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
