import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(NavigationRoutes.main);
          },
          color: AppTheme.facebook,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      );
}
