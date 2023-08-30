
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thirumathikart_app/controllers/buynow_controller.dart';
import 'package:thirumathikart_app/models/order_request.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'dart:convert';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';
import 'package:thirumathikart_app/views/buynow.dart';
import 'package:thirumathikart_app/views/cart.dart';
import 'package:thirumathikart_app/views/products.dart';

class ProductDetailsController extends GetxController {
  // dynamic productDynamic = 0.obs;
  // dynamic v = 0;
  Rx<int> productDynamic = 0.obs;
  RxList<ProductResponse> cartt = <ProductResponse>[].obs;
  RxList<double> v = <double>[].obs;
  
  
  
  // RxDouble grandTotal = RxDouble(0);
   RxDouble grandTotal = 0.0.obs;


  // RxList<ProductResponse> cartt = <ProductResponse>[].obs;
  GetStorage box = GetStorage();
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  
  // get itemm => productDynamic.value;

  Future<List<Map<String, dynamic>>> itemval() async {
    String? jsonString = await box.read('itemscart');
    List<dynamic> decodedList = jsonDecode(jsonString ?? '');
    return decodedList.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  void addItemToCart(ProductResponse product) {
    // var itemm=productDynamic.value;
    if (productDynamic == 0) {
      Get.snackbar('Invalid Order', 'Quantity cannot be zero.');
      return;
    }
    
    
    cartt.add(product);
    print('$cartt');
    // print('$itemm');

    List<Map<String, dynamic>> itemscart =
        cartt.map((ProductResponse e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemscart);
    box.write('itemscart', jsonString).then((value) => {
      //  updateQuantity(0),
          Get.snackbar('Message', 'Added to Cart.',
               duration: Duration(seconds: 1),
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
              backgroundColor: AppTheme.facebook,
              snackPosition: SnackPosition.TOP)
        }
       );

    // calculateGrandTotal();
    // updateQuantityy(0);
    // updatingSession();
    // printCartDetails();
    // goToCartPage();
    // v.clear();
     calculateGrandTotal();
     v.add(productDynamic.value.toDouble());  // Reset the productDynamic value after adding to the cart.
    printCartDetails();
   
    // updateQuantity(0);
    print('$v');
    updateQuantity(0);
    //  v.clear();

    // getUpdatedSessionCartData();
  }

  void updateQuantity(int quantity) {
     productDynamic.value = quantity;
    // var item=productDynamic;
  //  productDynamic(quantity);
  }

  // void updateQuantityy(int quantity) {
  //   // var item=productDynamic;
  //   // itemm(quantity);
  //   productDynamic.value=quantity;
  // }
  

  void updatingSession() {
    box.listenKey('itemscart', (updatedValue) {
      List<dynamic> decodedList = jsonDecode(updatedValue ?? '');
      cartt.clear();
      cartt.addAll(decodedList.map((e) => ProductResponse.fromJson(e)).toList());
      calculateGrandTotal();
    });
  }

  void removeProductFromCart(ProductResponse product,double indexes) {
    cartt.remove(product);
      v.remove(indexes);
      // if (indexes >= 0 && indexes < cartt.length) {
      // cartt.remove(product);
      // if (indexes < v.length) {
      //   v.remove(indexes);
      // }
    List<Map<String, dynamic>> itemsCart =
        cartt.map((ProductResponse e) => e.toJson()).toList();
    String jsonString = jsonEncode(itemsCart);
    box.write('itemscart', jsonString).then((value) => {
     
          Get.snackbar('Message', 'Removed from Cart.',
            duration:Duration(seconds: 1),
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
              backgroundColor: AppTheme.facebook,
              snackPosition: SnackPosition.TOP)
        });
      

    calculateGrandTotal();
  }


void calculateGrandTotal() {
  double total = 0;
  int cartItemCount = cartt.length;
  print(cartt.length);
   

  for (int i = 0; i < cartItemCount; i++) {
   
    double quantity = 0.0;

    // Check if v list is initialized and has the correct length
    if (v != null && i < v.length) {
      quantity = v[i];
    }
    
     if (cartt[i].product != null && cartt[i].product!.price != null) {
     
      total += (quantity * cartt[i].product!.price!);
    }
     grandTotal.value = total;
  }

 
}


 @override
  void onReady() {
    getUpdatedSessionCartData();
    super.onReady();
  }



   void transactionCompleted() {
    String setval = '[]';
    box.write('itemscart', setval).then((value) {
      grandTotal.value = 0;
      //cart.clear();
      Get.back();
      Get.snackbar('Message', 'Order Placed',
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          backgroundColor: const Color(0xff4D4D4D),
          snackPosition: SnackPosition.TOP);
    });
  }

  void createOrder(OrderRequest orderRequest) async {
    if (productDynamic.value == 0) {
      Get.snackbar('Invalid Order', 'Quantity cannot be zero.');
      return;
    }
    api.createOrder(orderRequest, storage).then((response) {
      Get.snackbar('Order Placed', 'Order Placed Successfully.');
      updateQuantity(0);
    }, onError: (err) {
      Get.snackbar('Failed To Place Order', err.toString());
    });
  
     
  }



  void getUpdatedSessionCartData() {
    if (box.hasData('itemscart')) {
      String? jsonString = box.read('itemscart');
      List<dynamic> decodedList = jsonDecode(jsonString ?? '');
      cartt.clear();
      cartt.addAll(decodedList.map((e) => ProductResponse.fromJson(e)).toList());
      calculateGrandTotal();
    }
    updatingSession();
  }
  void updateQuantityy(int quantity) {
    productDynamic(quantity);
  }


  void printCartDetails() async {
    if (box.hasData('itemscart')) {
      String? jsonString = box.read('itemscart');
      print(jsonString);

      List<dynamic> itemList = jsonDecode(jsonString ?? '');
      List<String> cartDetails = itemList.map((e) => e.toString()).toList();

      print('Cart Details:');
      cartDetails.forEach((detail) {
        print(detail);
      });
    }
  }


}


