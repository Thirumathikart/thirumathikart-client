import 'package:thirumathikart_app/models/product.dart';
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
                  List<Product> productList = [];
                  for (int i = 0; i < 10; i++) {
                    productList.add(Product(
                        id: i + 100,
                        name: 'Tomato',
                        image: 'assets/tomato.jpg',
                        parentId: products[index].id,
                        parentName: products[index].title,
                        price: i * 10 + 10,
                        unit: 'kg',
                        details: 'This is a Tomato.',
                        sellerDetails: 'This is sold by Thirumathikart.',
                        color: products[index].color));
                  }
                  //Get.toNamed('/products', arguments: productList);
                  Get.offAndToNamed('/products', arguments: productList);
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
