import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';
import 'package:thirumathikart_app/views/login.dart';

PreferredSizeWidget appBar(String label, BuildContext context) => AppBar(
    backgroundColor: AppTheme.bg,
    elevation: 1,
    iconTheme: IconThemeData(color: AppTheme.textPrimary),
    title: Row(children: [
      Container(
          margin: const EdgeInsets.only(left: 0, top: 5, bottom: 5, right: 10),
          child: Image.asset(
            'assets/tk.png',
            width: 30,
            height: 30,
          )),
      Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            fontSize: 20),
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
            IconButton(
              onPressed: () {
                // BuildContext? context;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout),
            ),
            const SizedBox(width: 15.0)
          ],
        ),
      )
    ],
    centerTitle: false);
