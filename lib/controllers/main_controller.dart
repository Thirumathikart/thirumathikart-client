import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;
  late PageController pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final storage = Get.find<StorageServices>();
  var userToken = '';
  final api = Get.find<ApiServices>().api;
  final storageServices = Get.find<StorageServices>();
  void fetchAddress() async{
    api.fetchAddress(storageServices).then((value) => value);
  }
  @override
  void onInit() async {
    fetchAddress();
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
   void logout()async{
    Get.offAllNamed(NavigationRoutes.loginRoute);
    // navigateToLogin();
  }
  void onPageChanged() {
    pageController.animateToPage(selectedIndex.value,
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  bool userTokenFetch() {
    if (storage.getUser() == null) {
      userToken = '';
    } else {
      userToken = storage.getUser()!;
    }
    if (userToken == '') {
      return false;
    } else {
      return true;
    }
  }

  // void logout() {}
}
