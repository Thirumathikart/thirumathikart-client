import 'package:get/get.dart';
import 'package:thirumathikart_app/constants/product_constants.dart';
import 'package:thirumathikart_app/models/orders.dart';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class OrdersController extends GetxController {
  RxList<OrderDisplay> order = <OrderDisplay>[].obs;
  final api = Get.find<ApiServices>().api;
  final storageService = Get.find<StorageServices>();

  void fetchOrder() async {
    await api.fetchOrder(storageService).then((response) {
      Get.snackbar('Order Fetched', 'Order Fetched Successfully.');
      for (int i = 0; i < response.response!.length; i++) {
        var total = 0;
        final orderItems = <OrderItemDisplay>[];
        for (int j = 0; j < response.response![i].items!.length; j++) {
          orderItems.add(OrderItemDisplay(
            name: response.response![i].items![j].name,
            category: ProductConstants
                .categoryMap[response.response![i].items![j].categoryId]
                .toString(),
            description: response.response![i].items![j].description,
            price: response.response![i].items![j].price,
            quantity: response.response![i].items![j].quantity,
            totalPrice: response.response![i].items![j].price! *
                response.response![i].items![j].quantity!,
          ));
          total += response.response![i].items![j].price! *
              response.response![i].items![j].quantity!;
        }
        order.add(OrderDisplay(
          id: response.response![i].order!.id,
          status: response.response![i].order!.orderStatus.toString(),
          totalAmount: total,
          orderItemsList: orderItems,
          customerAddress: response.response![i].customer!.address!.line1,
          sellerName: '${response.response![i].seller!.firstName} ${response.response![i].seller!.lastName}',
          sellerAddress: response.response![i].seller!.address!.line1,
        ));
      }
    }, onError: (err) {
      Get.snackbar('Failure','No orders made yet' );
    });
    // final response;
    // order.value = [
    //   OrderDisplay(
    //       id: 1,
    //       status: 'Delivered',
    //       totalAmount: 1000,
    //       customerAddress: 2,
    //       sellerAddress: 3,
    //       orderItemsList: [
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200)
    //       ]),
    //   OrderDisplay(
    //       id: 2,
    //       status: 'Shipped',
    //       totalAmount: 100,
    //       customerAddress: 5,
    //       sellerAddress: 7,
    //       orderItemsList: [
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200)
    //       ]),
    // ];
    //order = response;
  }
}

void fetchOrder() async {}
