import 'package:flutter/material.dart';
import 'package:thirumathikart_app/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/widgets/cart/row_cart.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Material(
        child: Container(
            margin: const EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 10, right: 10),
            color: AppTheme.card,
            child: Obx(() => controller.cart.isEmpty
                ? const Center(
                    child: Text('Your cart is empty'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: controller.cart.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) => RowCart(
                              product: controller.cart[index],
                              index: index,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Grand Total : ₹. ${NumberFormat.currency(
                                  decimalDigits: 0,
                                  symbol: '',
                                ).format(
                                  controller.grandTotal.value,
                                )}",
                              ),
                              Container(
                                width: 150,
                                height: 40,
                                margin: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: controller.transactionCompleted,
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          color: Colors.red,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        '   BUY NOW   ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))));
  }
}
