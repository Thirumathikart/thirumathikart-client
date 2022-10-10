import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/product.dart';

class ProductsController extends GetxController {
  final textController = TextEditingController();
  final items = [].obs;
  final c = 0.obs;
  final isSelected = [true, false].obs;
  void reverse() {
    items(items.reversed.toList());
  }

  void add(List productsList, Product item) {
    items.add(item);
  }

  void empty() {
    items([]);
  }

  void copy(List<Product> productsList) {
    items(productsList);
  }

  int length() => items.length;

  void set(int i, bool a) {
    isSelected[i] = a;
  }

  void done() {
    c(1);
  }
}
