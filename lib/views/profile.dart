import 'package:flutter/material.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/widgets/home/appbar_home.dart';
import 'package:thirumathikart_app/widgets/home/home_body.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/controllers/home_controller.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_drawer.dart';

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const BuildAppBar(),
      drawer: const NavWidget(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppTheme.google,
                radius: 80,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/tomato.jpg'),
                  radius: 75,
                ),
              ),
            )
          ],
        ),
      ));
}
