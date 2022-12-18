import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';

class RegisterButton extends GetView<AuthController> {
  const RegisterButton({super.key});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {
            // Validation
            print(controller.firstNameTextController.text);
            controller.register();
          },
          color: AppTheme.facebook,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Register',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      );
}
