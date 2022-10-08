import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/controllers/home_controller.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_drawer.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar('Home'),
      drawer: const NavWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Home Page'),
          ],
        ),
      ));
}
