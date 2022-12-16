import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/constants/orders_constants.dart';
import 'package:thirumathikart_app/controllers/orders_controller.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: appBar('My Orders'), body: buildItems(orderList));
  Widget buildItems(List<Map<String, String>> orderList) => GridView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 32, bottom: 32),
        itemBuilder: ordersList,
        itemCount: orderList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
  Widget ordersList(context, index) => Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
          height: 300,
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(children: [
            Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: Image.asset(
                    orderList[index]['image']!,
                    height: 200,
                    width: 200,
                  ),
                )),
            Container(
              margin:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 5),
              alignment: Alignment.center,
              child: Text(
                '${orderList[index]["ProductName"]}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 5, right: 5),
              alignment: Alignment.center,
              child: Text(
                '${orderList[index]["Price"]}',
                style: TextStyle(
                  fontSize: 10,
                  color: AppTheme.textPrimary,
                ),
              ),
            )
          ])));
}
