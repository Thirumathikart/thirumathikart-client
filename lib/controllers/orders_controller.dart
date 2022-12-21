import 'package:get/get.dart';
import 'package:thirumathikart_app/models/orders.dart';

class OrdersController extends GetxController {
  RxList<OrderDisplay> order = <OrderDisplay>[].obs;

  void fetchOrder() async {
    // final response;
    order.value = [
      OrderDisplay(
          id: 1,
          status: 'Delivered',
          totalAmount: 1000,
          customerAddress: 2,
          sellerAddress: 3,
          orderItemsList: [
            OrderItemDisplay(
                name: 'Order1',
                category: 'Food',
                description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
                price: 10,
                quantity: 20,
                totalPrice: 200),
            OrderItemDisplay(
                name: 'Order1',
                category: 'Food',
                description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
                price: 10,
                quantity: 20,
                totalPrice: 200),
            OrderItemDisplay(
                name: 'Order1',
                category: 'Food',
                description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
                price: 10,
                quantity: 20,
                totalPrice: 200)
          ]),
      OrderDisplay(
          id: 2,
          status: 'Shipped',
          totalAmount: 100,
          customerAddress: 5,
          sellerAddress: 7,
          orderItemsList: [
            OrderItemDisplay(
                name: 'Order1',
                category: 'Food',
                description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
                price: 10,
                quantity: 20,
                totalPrice: 200),
            OrderItemDisplay(
                name: 'Order1',
                category: 'Food',
                description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
                price: 10,
                quantity: 20,
                totalPrice: 200)
          ]),
    ];
    //order = response;
  }
}
