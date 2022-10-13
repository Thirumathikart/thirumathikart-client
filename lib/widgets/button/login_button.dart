import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';

class LoginButton extends GetView<AuthController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
            onPressed: () {
              controller.login();
            },
            color: AppTheme.facebook,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Obx(
              () => !controller.isLoading.value
                  ? const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )
                  : const CircularProgressIndicator(color: Colors.white),
            )),
      );
}
