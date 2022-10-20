import 'package:thirumathikart_app/widgets/auth/carousel.dart';
import 'package:thirumathikart_app/widgets/auth/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child:
                SizedBox(width: double.infinity, child: carousel(controller)),
          ),
          signIn()
        ],
      );
}
