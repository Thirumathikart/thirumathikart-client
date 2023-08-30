import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/controllers/auth_controller.dart';
// import 'package:thirumathikart_delivery/controllers/auth_controller.dart';
// import 'package:your_app/controllers/auth_controller.dart';

class ForgotPasswordPage extends GetView<AuthController> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // controller: controller .emailNameTextController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // controller.forgotPassword();
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
