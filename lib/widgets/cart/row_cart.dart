import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/controllers/cart_controller.dart';
import 'package:thirumathikart_app/controllers/product_detail_controller.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RowCart extends StatelessWidget {
  static late CartController controllers;
  static late ProductDetailsController controller;
  final int index;

  final ProductResponse product;
  const RowCart({
    Key? key,
    required this.index,
    required this.product, required ProductDetailsController controllers,
    // controller =controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllers = Get.find<CartController>();
    controller =Get.find<ProductDetailsController>();

    return Container(
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: product.imageUrl!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ))),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${product.product!.title}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "₹ ${NumberFormat.currency(decimalDigits: 0, symbol: '').format(product.product!.price)}",
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Total - ₹ ${NumberFormat.currency(decimalDigits: 0, symbol: '').format(product.product!.price! * product.product!.quantity!)}",
                ),
                Text(product.product!.quantity.toString()),
                Expanded(child: _buildQty()),
              ],
            ),
          ),
          SizedBox(
            width: 30.0,
            child: TextButton(
              child: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
              // onPressed:() {
              // },
              onPressed: () => controllers.removeSelectedItemFromCart(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQty() => Row(
        children: [
          Row(
            children: [
              const Text(
                'qty: ',
                style: TextStyle(fontSize: 12),
              ),
              IconButton(
                onPressed: () =>
                    controllers.decreaseQtyOfSelectedItemInCart(index, product),
                icon: const Icon(
                  Icons.remove,
                  size: 12,
                ),
              ),
              Text(product.product!.quantity.toString()),
              IconButton(
                onPressed: () =>
                    controllers.increaseQtyOfSelectedItemInCart(index),
                icon: const Icon(
                  Icons.add,
                  size: 12,
                ),
              ),
            ],
          )
        ],
      );
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:thirumathikart_app/controllers/product_detail_controller.dart';
// // import 'package:thirumathikart_app/controllers/product_details_controller.dart';
// import 'package:thirumathikart_app/models/prodcut_response.dart';
// // import 'package:thirumathikart_app/models/product_response.dart';

// class CartPage extends StatelessWidget {
//   final ProductDetailsController _controller = Get.find<ProductDetailsController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: _controller.cart.length,
//           itemBuilder: (context, index) {
//             ProductResponse product = _controller.cart[index];
//             return ListTile(
//               title: Text(product.name),
//               subtitle: Text('Price: \$${product.price}'),
//               trailing: IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: () {
//                   _controller.removeSelectedItemFromCart(product);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
