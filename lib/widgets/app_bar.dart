import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

PreferredSizeWidget appBar(String label) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.textPrimary),
    title: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
          fontSize: 22),
    ),
    actions: [
      Visibility(
        visible: Get.routing.current == NavigationRoutes.main,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            const SizedBox(width: 15.0)
          ],
        ),
      )
    ],
    centerTitle: true);
