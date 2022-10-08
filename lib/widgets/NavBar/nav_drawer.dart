import 'package:flutter/material.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_item.dart';

class NavWidget extends StatelessWidget {
  const NavWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[100],
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
                  const Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const NavItemWidget(
                title: 'Home',
                icon: Icon(Icons.house_outlined),
                toRoute: '/auth'),
            const NavItemWidget(
                title: 'Profile',
                icon: Icon(Icons.person_outline),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'Wishlist',
                icon: Icon(Icons.favorite_border_outlined),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'My Orders',
                icon: Icon(Icons.fire_truck_outlined),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'Login',
                icon: Icon(Icons.login_outlined),
                toRoute: '/main'),
            const Divider(),
            const NavItemWidget(
                title: 'Offers',
                icon: Icon(Icons.local_offer_outlined),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'About App',
                icon: Icon(Icons.info_outline_rounded),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'Feedback',
                icon: Icon(Icons.feedback_outlined),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'Help Center',
                icon: Icon(Icons.help_center_outlined),
                toRoute: '/main'),
            const Divider(),
            const NavItemWidget(
                title: 'App Tour',
                icon: Icon(Icons.touch_app_outlined),
                toRoute: '/main'),
            const NavItemWidget(
                title: 'Explore',
                icon: Icon(Icons.explore_outlined),
                toRoute: '/main'),
          ],
        ),
      );
}
