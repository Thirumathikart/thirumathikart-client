import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

PreferredSizeWidget appBar(String label, {bool isMain = false}) => AppBar(
    backgroundColor: AppTheme.bg,
    elevation: 1,
    iconTheme: IconThemeData(color: AppTheme.textPrimary),
    title: Row(
        mainAxisAlignment:
            isMain ? MainAxisAlignment.start : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isMain
              ? Container(
                  margin: const EdgeInsets.only(
                      left: 0, top: 5, bottom: 5, right: 10),
                  child: Image.asset(
                    'assets/tk.png',
                    width: 35,
                    height: 35,
                  ))
              : const SizedBox(width: 0),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
                fontSize: 22),
          )
        ]),
    actions: [
      Visibility(
        visible: Get.routing.current == NavigationRoutes.main,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              icon: const Icon(Icons.notifications),
            ),
            const SizedBox(width: 15.0)
          ],
        ),
      )
    ],
    centerTitle: !isMain);
