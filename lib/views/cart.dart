
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thirumathikart_app/config/navigations.dart';
import 'package:thirumathikart_app/constants/api_constants.dart';
import 'package:thirumathikart_app/constants/homeproduct_list.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';
import 'package:thirumathikart_app/controllers/product_detail_controller.dart';
import 'package:thirumathikart_app/controllers/products_controller.dart';
import 'package:thirumathikart_app/main.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/views/buynow.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:thirumathikart_app/views/products.dart';


class CartPage extends GetView<ProductDetailsController> {
    final ProductDetailsController controller = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Cart'),
      // ),
      body: controller.cartt.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/tklogo.jpeg', // Replace with your image path
                    width: 200,
                    height: 200,
                  ),
                  Text('Your cart is empty'),
                ],
              ),
            ):Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.cartt.length,
                  itemBuilder: (context, index) {
                  
                    double indexes=controller.v[index];
                    ProductResponse product = controller.cartt[index];
                
                    return ListTile(
                       leading: product.imageUrl != null
                            ? Image.network(
                                '${ApiConstants.productBaseUrl}/${product.imageUrl!}',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                    
                      :Container(),
                      title: Text('Title: ${product.product!.title}'),
                      subtitle: Text('Price: ₹${product.product!.price}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                       
                          Text('${indexes}'
                          ),
                          SizedBox(width:20),
                    
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.removeProductFromCart(product,indexes);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(),
          ListTile(
          
             title:Text('Grand Total: ₹${controller.grandTotal.value}'),
          ),
          SizedBox(height: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BuyNowPage()),
  );
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}




