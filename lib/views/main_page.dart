import 'package:flutter/material.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/main_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/views/cart.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:thirumathikart_app/views/login.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_list.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class Main extends GetView<MainController> {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          appBar: appBar('Thirumathikart'),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [HomePage(), CartPage(), HomePage(), LoginPage()],
            ),
          ]),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                if (value < 4) {
                  controller.selectedIndex.value = value;
                  controller.onPageChanged();
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Wrap(
                          children: moreList
                              .map(
                                (e) => ListTile(
                                  leading: e['icon'] as Widget,
                                  title: Text(e['title'] as String),
                                ),
                              )
                              .toList()));
                }
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppTheme.navColor,
              unselectedItemColor: AppTheme.deSelected,
              selectedLabelStyle: TextStyle(color: AppTheme.textPrimary),
              showUnselectedLabels: false,
              selectedFontSize: 10,
              items: navList
                  .map((e) => BottomNavigationBarItem(
                        icon: e['icon'] as Widget,
                        label: e['title'] as String,
                      ))
                  .toList()))));
}
