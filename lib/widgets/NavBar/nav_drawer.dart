import 'package:flutter/material.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_item.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_list.dart';
import 'package:thirumathikart_app/config/themes.dart';

class NavWidget extends StatelessWidget {
  const NavWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.navColor,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 100.0,
                    width: 100.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            for (var item in navList)
              Column(
                children: [
                  NavItemWidget(
                    title: item['title'].toString(),
                    icon: item['icon'] as Icon,
                    toRoute: item['toRoute'].toString(),
                  ),
                  if (item['title'].toString() == 'Login' ||
                      item['title'].toString() == 'Help Center')
                    const Divider()
                ],
              )
          ],
        ),
      );
}
