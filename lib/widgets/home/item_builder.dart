import 'package:thirumathikart_app/widgets/home/item_card.dart';
import 'package:thirumathikart_app/constants/homeproduct_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListBuild extends StatelessWidget {
  const ItemListBuild({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed('/details/$index');
                },
                child: ItemCard(
                  product: products[index],
                ),
              ),
            ),
          ),
        ),
      );
}
