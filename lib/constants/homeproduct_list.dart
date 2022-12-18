import 'package:thirumathikart_app/models/category.dart';
import 'package:flutter/material.dart';

List<Category> products = [
  Category(
      id: 1,
      title: 'Fahion and Jewellery',
      image: 'assets/images/bag_1.png',
      route: 'Fashion-and-Jewellery',
      color: const Color(0xFF3D82AE)),
  Category(
      id: 2,
      title: 'Handicraft',
      route: 'Handicraft',
      image: 'assets/images/bag_2.png',
      color: const Color(0xFFD3A984)),
  Category(
      id: 3,
      title: 'Beauty and Healthcare',
      route: 'Beauty',
      image: 'assets/images/bag_3.png',
      color: const Color(0xFF989493)),
  Category(
      id: 4,
      title: 'Clothing',
      route: 'Clothing',
      image: 'assets/images/bag_4.png',
      color: const Color(0xFFE6B398)),
  Category(
      id: 5,
      title: 'Food',
      route: 'Food',
      image: 'assets/images/bag_5.png',
      color: const Color(0xFFFB7883)),
  Category(
    id: 6,
    title: 'Grocery',
    route: 'Grocery',
    image: 'assets/images/bag_6.png',
    color: const Color(0xFFAEAEAE),
  ),
  Category(
    id: 7,
    title: 'Office Code',
    route: 'Kitchen-supplies',
    image: 'assets/images/bag_8.png',
    color: const Color.fromARGB(255, 40, 153, 61),
  ),
  Category(
    id: 8,
    title: 'Organic Fruits & Vegetables',
    route: 'Organic',
    image: 'assets/images/bag_7.png',
    color: const Color.fromARGB(255, 98, 46, 130),
  ),
  Category(
    id: 9,
    title: 'Others',
    route: 'Others',
    image: 'assets/images/bag_9.png',
    color: const Color.fromARGB(255, 75, 168, 205),
  ),
];
