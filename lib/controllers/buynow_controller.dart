// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:thirumathikart_app/config/themes.dart';
// import 'package:thirumathikart_app/models/order_request.dart';
// import 'package:thirumathikart_app/models/prodcut_response.dart';
// import 'package:thirumathikart_app/services/api_services.dart';
// import 'package:thirumathikart_app/services/storage_services.dart';
// import 'package:thirumathikart_app/views/buynow.dart';

// class BuyNowController extends GetxController {

//   Rx<int> productDynamic = 0.obs;
//   RxList<ProductResponse> cart = <ProductResponse>[].obs;
//   // RxList<double> v = <double>[].obs;
  
  
  
//   // RxDouble grandTotal = RxDouble(0);
//    RxDouble Total = 0.0.obs;


//   // RxList<ProductResponse> cart = <ProductResponse>[].obs;
//   GetStorage box = GetStorage();
//   final api = Get.find<ApiServices>().api;
//   final storage = Get.find<StorageServices>();
  
//   // void buyNow(BuildContext context, List<ProductResponse> cart, double grandTotal) {
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (context) => BuyNowPage(),
//   //     ),
//   //   );
//   // }



//   Future<List<Map<String, dynamic>>> itemval() async {
//     String? jsonString = await box.read('itemscartt');
//     List<dynamic> decodedList = jsonDecode(jsonString ?? '');
//     return decodedList.map((e) => Map<String, dynamic>.from(e)).toList();
//   }

//   void adItemToCart(ProductResponse product) {
//     // var itemm=productDynamic.value;
//     if (productDynamic == 0) {
//       Get.snackbar('Invalid Order', 'Quantity cannot be zero.');
//       return;
//     }
    
    
//     cart.add(product);
//     print('$cart');

//     // print('$itemm');

//     List<Map<String, dynamic>> itemscart =
//         cart.map((ProductResponse e) => e.toJson()).toList();
//     String jsonString = jsonEncode(itemscart);
//     box.write('itemscartt', jsonString).then((value) => {
//       //  updateQuantity(0),
//           Get.snackbar('Message', 'Order placed',
//                duration: Duration(seconds: 1),
//               colorText: Colors.white,
//               margin: const EdgeInsets.all(10),
//               backgroundColor: AppTheme.facebook,
//               snackPosition: SnackPosition.TOP)
//         }
//        );

//     // calculateGrandTotal();
//     // updateQuantityy(0);
//     // updatingSession();
//     // printCartDetails();
//     // gotobuynow();
//     // v.clear();
//      calculateGrandTotal();
//      printCartDetails();
//      buyNow(product);
//     //  v.add(productDynamic.value.toDouble());  // Reset the productDynamic value after adding to the cart.
//     // printCartDetails();
   
//     // updateQuantity(0);
//     // print('$v');
//     // updateQuantity(0);
//     //  v.clear();

//     // getUpdatedSessionCartData();
//   }

//     void gotobuynow() {
// // calculateGrandTotal();

//     Get.to(() => BuyNowPage());
    
//   }


  // void logout()async{
  //   Get.offAllNamed(NavigationRoutes.loginRoute);
  //   navigateToLogin();
  // }
  // void logout() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Get.offAndToNamed(NavigationRoutes.loginRoute);
  //   });

// // void calculategrandTotal() {
// //     double total = 0;
// //     for (int i = 0; i < cart.length; i++) {
// //       double quantity = v.length> i ? v[i] : 0.0;
// //       if (cart[i].product != null && cart[i].product!.price != null) {
// //         total += (quantity * cart[i].product!.price!);
// //       }
// //     }

// //     grandTotal.value = total;
    
// //   }
// void printCartDetails() async {
//     if (box.hasData('itemscartt')) {
//       String? jsonString = box.read('itemscartt');
//       print(jsonString);

//       List<dynamic> itemList = jsonDecode(jsonString ?? '');
//       List<String> buynowDetails = itemList.map((e) => e.toString()).toList();

//       print('Buynow Details:');
//       buynowDetails.forEach((detaill) {
//         print(detaill);
//       });
//     }
//   }

//   void updateQuantity(int quantity) {
//      productDynamic(quantity);
//   }

//     void createOrder(OrderRequest orderRequest) async {
//     if (productDynamic.value == 0) {
//       Get.snackbar('Invalid Order', 'Quantity cannot be zero.');
//       return;
//     }
//     api.createOrder(orderRequest, storage).then((response) {
//       Get.snackbar('Order Placed', 'Order Placed Successfully.');
//       updateQuantity(0);
//     }, onError: (err) {
//       Get.snackbar('Failed To Place Order', err.toString());
//     });
  
     
//   }


// //  void calculateGrandTotal() {
// //   double total = 0.0;
// //   for (ProductResponse product in cart) {
// //     if (product.product != null && product.product!.price != null) {
// //       total += (productDynamic.value * product.product!.price!);
// //     }
// //   }
// //   Total.value = total;
// // }


//  void calculateGrandTotal() {
//     double total = 0;
//     for (ProductResponse product in cart) {
//       if (productDynamic!= null && product.product != null && product.product!.price != null) {
//         total += (productDynamic * product.product!.price!);
//       }
//       if (productDynamic== null && product.product == null && product.product!.price == null) {
//         total -= (productDynamic * product.product!.price!);
//       }
//     }
//     Total.value = total;
//     // updatingSession();
//     // updateQuantity(0);
//   }

//     void buyNow(ProductResponse product) {
     
//       print('Product Name: ${product.product!.title}');
//       print('Quantity: ${productDynamic}');
//       print('Price: ${product.product!.price}');
    
//     print('Grand Total: $Total');
//   }

 
// }

