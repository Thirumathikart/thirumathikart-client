import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

class NavItemWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String? toRoute;
  const NavItemWidget(
      {super.key, required this.title, required this.icon, this.toRoute});

  @override
  Widget build(BuildContext context) => Ink(
      color: Get.routing.current == toRoute
          ? AppTheme.navHighlight
          : Colors.transparent,
      child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () => Get.toNamed(toRoute ?? NavigationRoutes.main)));
}
