import 'package:thirumathikart_app/models/category.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Category product;

  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthVal = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: '${product.id}',
              child: SizedBox(
                width: widthVal / 2 - 100,
                child: Image.asset(product.image!),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
          child: Center(
            child: Text(
              product.title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
