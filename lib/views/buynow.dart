

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thirumathikart_app/constants/api_constants.dart';
import 'package:thirumathikart_app/controllers/buynow_controller.dart';
import 'package:thirumathikart_app/controllers/product_detail_controller.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';

class BuyNowPage extends GetView<ProductDetailsController> {
  final ProductDetailsController controller = Get.put(ProductDetailsController());
  bool payOnline = false; // Initially set to pay online

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//     appBar: AppBar(
//   backgroundColor: Colors.white, // Set the background color to black
//    iconTheme: IconThemeData(
//     color: Colors.black, // Set the arrow color to black
//   ),
//    Image.asset(
//                     'assets/tklogo.jpeg', // Replace with your image path
//                     width: 200,
//                     height: 200,
//                   ),
//   title: Text(
//     'Buy Now',
//     style: TextStyle(
//       color: Colors.black, // Set the text color to white
//     ),
//   ),
// ),

appBar: AppBar(
  backgroundColor: Colors.white, // Set the background color to black
  iconTheme: IconThemeData(
    color: Colors.black, // Set the arrow color to black
  ),
  title: Row(
    children: [
      Image.asset(
         'assets/tklogo.jpeg', // Replace with your image path
                    width: 50,
                    height: 50,
      ),
      SizedBox(width: 10), // Add spacing between image and text
      Text(
        'Buy Now',
        style: TextStyle(
          color: Colors.black, // Set the text color to white
        ),
      ),
    ],
  ),
),


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
            )
          : Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.cartt.length,
                      itemBuilder: (context, index) {
                        ProductResponse product = controller.cartt[index];
                        double indexes = controller.v[index];
                        // String? ImageURL=product.imageUrl;
                        return ListTile(
                          leading: product.imageUrl != null
                              ? Image.network(
                                  '${ApiConstants.productBaseUrl}/${product.imageUrl!}',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                          title: Text('Title: ${product.product!.title}'),
                          subtitle: Text('Price: ₹${product.product!.price}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${indexes}'),
                              SizedBox(width: 20),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Grand Total : ₹. ${NumberFormat.currency(
                      decimalDigits: 0,
                      symbol: '',
                    ).format(
                      controller.grandTotal.value,
                    )}",
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPaymentDialog(context);
        },
        child: Icon(Icons.payment),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Payment Method"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Pay Online"),
                leading: Radio(
                  value: true,
                  groupValue: payOnline,
                  onChanged: (value) {
                    // setState(() {
                    //   payOnline = value;
                    // });
                  },
                ),
              ),
              ListTile(
                title: Text("Cash on Delivery"),
                leading: Radio(
                  value: false,
                  groupValue: payOnline,
                  onChanged: (value) {
                    // setState(() {
                    //   payOnline = value;
                    // });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (payOnline) {
                  _showQRCodeDialog(context);
                } else {
                  // Implement cash on delivery logic here
                }
              },
              child: Text("Proceed"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _showQRCodeDialog(BuildContext context) {
    // Implement the QR code display logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pay Online - Scan QR Code"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  QrImage(
              //   data: "https://www.example.com/payment", // Replace with the actual payment URI
              //   version: QrVersions.auto,
              //   size: 200.0,
              // ),

              // Add your QR code widget here
              // This could be an image, a custom widget, or any QR code generator plugin/widget.
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPaymentResultDialog(context, true);
                // Add the payment success logic here
              },
              child: Text("Payment Success"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPaymentResultDialog(context, false);
                // Add the payment failure logic here
              },
              child: Text("Payment Failed"),
            ),
          ],
        );
      },
    );
  }
}

// class QrImage {
// }

// class QrVersions {
//   static var auto;
// }

void _showPaymentResultDialog(BuildContext context, bool success) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(success ? "Payment Success" : "Payment Failed"),
        content: Text(success
            ? "Thank you for your payment!"
            : "Payment failed. Please try again."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add any additional logic here after the payment result is displayed.
              if (success) {
                // Navigate to a success screen or perform any post-payment actions.
              } else {
                // Handle the payment failure case or prompt the user to try again.
              }
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}