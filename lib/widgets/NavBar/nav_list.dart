import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

var navList = [
  {
    'title': 'Home',
    'icon': const Icon(Icons.home_outlined),
    'toRoute': NavigationRoutes.main,
  },
  {
    'title': 'Cart',
    'icon': const Icon(Icons.shopping_cart_outlined),
    'toRoute': NavigationRoutes.cartRoute,
  },
  // {
  //   'title': 'My Orders',
  //   'icon': const Icon(Icons.fire_truck_outlined),
  //   'toRoute': NavigationRoutes.ordersRoute,
  // },
  {
    'title': 'Profile',
    'icon': const Icon(Icons.person_outline),
    'toRoute': NavigationRoutes.profileRoute,
  },
  {
    'title': 'More',
    'icon': const Icon(Icons.more_horiz),
    'toRoute': NavigationRoutes.authRoute,
  },
];

var moreList = [
  // {
  //   'title': 'Offers',
  //   'icon': const Icon(Icons.local_offer_outlined),
  //   'toRoute': NavigationRoutes.offersRoute,
  // },
  // {
  //   'title': 'About App',
  //   'icon': const Icon(Icons.info_outline),
  //   'toRoute': NavigationRoutes.aboutRoute,
  // },
  // {
  //   'title': 'Feedback',
  //   'icon': const Icon(Icons.feedback_outlined),
  //   'toRoute': NavigationRoutes.feedbackRoute,
  // },
  // {
  //   'title': 'Help Center',
  //   'icon': const Icon(Icons.login_outlined),
  //   'toRoute': NavigationRoutes.helpRoute,
  // },
  // {
  //   'title': 'App Tour',
  //   'icon': const Icon(Icons.local_offer_outlined),
  //   'toRoute': NavigationRoutes.tourRoute,
  // },
  // {
  //   'title': 'Explore',
  //   'icon': const Icon(Icons.info_outline),
  //   'toRoute': NavigationRoutes.exploreRoute,
  // },
  {
    'title': 'Terms and Conditions',
    'icon': const Icon(Icons.info_outline),
    'toRoute': NavigationRoutes.tcroute,
  },
  {
    'title': 'Privacy and Policy',
    'icon': const Icon(Icons.info_outline),
    'toRoute': NavigationRoutes.privpolicyroute,
  },
  {
    'title': 'My Orders',
    'icon': const Icon(Icons.info_outline),
    'toRoute': NavigationRoutes.myOrdersRoute,
  },
];
