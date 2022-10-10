// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/config/themes.dart';

class Product_Detail extends StatefulWidget {
  late Product product;
  Product_Detail(this.product);

  @override
  // ignore: library_private_types_in_public_api
  _Product_Detatil createState() => _Product_Detatil(product);
}

class _Product_Detatil extends State<Product_Detail> {
  Product product;
  _Product_Detatil(this.product);

  @override
  void initState() {
    product.quantity = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.bg,
        appBar: AppBar(
          centerTitle: true,
          title: Text(product.name!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    product.image!,
                  )),
            ),
            Text(
              '${product.name!} (1 ${product.unit!})',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹ ${product.price}',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Quantity : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (product.quantity! > 0) {
                          product.quantity = product.quantity! - 1;
                        }
                      });
                    },
                    child: const Text('-'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        product.quantity = product.quantity! + 1;
                      });
                    },
                    child: const Text('+'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {

                    },
                     child: const Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 20,

                      ),
                     ),
                     
                     ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {

                    },
                     child: const Text(
                      'Buy now',
                      style: TextStyle(
                        fontSize: 20,
                        
                      ),
                     ),
                     
                     ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.details!,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Seller Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.sellerDetails!,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            
          ]
          ),
        ),
      );
}
