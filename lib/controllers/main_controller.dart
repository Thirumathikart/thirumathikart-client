import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;
  late PageController pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final storage = Get.find<StorageServices>();
  var userToken = '';

  @override
  void onInit() async {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
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
}
