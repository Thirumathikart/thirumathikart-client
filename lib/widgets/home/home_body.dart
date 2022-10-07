import 'package:thirumathikart_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/widgets/home/slide_banner.dart';
import 'package:thirumathikart_app/widgets/home/item_builder.dart';

class Body extends GetView<HomeController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            SlideBanner(),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            ItemListBuild(),
          ],
        ),
      ),
    );
}
