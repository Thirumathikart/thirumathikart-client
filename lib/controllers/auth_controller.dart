import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';
import 'package:thirumathikart_app/models/login_request.dart';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class AuthController extends GetxController {
  PageController pageViewController = PageController(initialPage: 0);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final isLoading = false.obs;
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    final userName = userNameTextController.text;
    final password = passwordTextController.text;
    if (userName.isEmpty || password.isEmpty) {
      Get.snackbar('Invalid Credentials', 'Unable To Login');
      return;
    }
    isLoading.value = true;
    api
        .loginCutomer(
            LoginRequest(username: userName, password: password), storage)
        .then((response) {
      isLoading.value = false;
      navigateToHome();
    }, onError: (err) {
      isLoading.value = false;
      Get.snackbar('Failed To Login', err.toString());
    });
  }

  void navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAndToNamed(NavigationRoutes.main);
    });
  }
}
