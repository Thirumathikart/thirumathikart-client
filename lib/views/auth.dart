import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';
import 'package:thirumathikart_app/widgets/auth/carousel.dart';
import 'package:thirumathikart_app/widgets/auth/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_drawer.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.bg,
        drawer: const NavWidget(),
        appBar: appBar('ThirumathiKart'),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                    width: double.infinity, child: carousel(controller)),
              ),
              signIn()
            ],
          ),
        ),
      );
}
