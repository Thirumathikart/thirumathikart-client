import 'package:flutter/material.dart';
import 'package:thirumathikart_app/controllers/products_controller.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:thirumathikart_app/views/product_detail.dart';
import 'package:get/get.dart';

class Products extends GetView<ProductsController> {
  final List<Product> productsListMain;
  Products(this.productsListMain, {Key? key}) : super(key: key);
  final FocusNode focusNode = FocusNode();
  final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    if (productsController.c.value == 0) {
      productsController.copy(productsListMain);
      productsController.done();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          productsListMain[0].parentName!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const HomePage());
          },
          child: const Icon(
            Icons.home,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Search : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 175,
                    child: TextField(
                      controller: productsController.textController,
                      showCursor: true,
                      cursorHeight: 25,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      focusNode: focusNode,
                      onChanged: (_) {
                        productsController.empty();
                        for (int i = 0; i < productsListMain.length; i++) {
                          if (productsListMain[i].name!.toLowerCase().contains(
                              productsController.textController.text)) {
                            productsController.add(
                                productsController.items.toList(),
                                productsListMain[i]);
                          }
                        }
                        if (productsController.isSelected[0] == false &&
                            productsController.isSelected[1] == true) {
                          productsController.reverse();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: IconButton(
                      onPressed: focusNode.requestFocus,
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sort by Price : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Obx(
                          () => ToggleButtons(
                            borderColor: Colors.black,
                            fillColor: Colors.grey,
                            borderWidth: 2,
                            selectedBorderColor: Colors.black,
                            selectedColor: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                            onPressed: (int index) {
                              for (int i = 0;
                                  i < productsController.isSelected.length;
                                  i++) {
                                productsController.set(i, i == index);
                              }
                              if (productsController.isSelected[0] == false &&
                                  productsController.isSelected[1] == true) {
                                productsController.reverse();
                              }
                              if (productsController.isSelected[1] == false &&
                                  productsController.isSelected[0] == true) {
                                productsController.reverse();
                              }
                            },
                            isSelected: productsController.isSelected,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Low - High',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'High - Low',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Get.to(ProductDetail(
                            productsController.items[index], productsListMain));
                      },
                      child: Card(
                        color: AppTheme.bg,
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: ListTile(
                            leading: Image(
                              alignment: Alignment.center,
                              width: 100,
                              height: 100,
                              image: AssetImage(
                                  productsController.items[index].image!),
                              fit: BoxFit.fill,
                            ),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    productsController.items[index].name!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //subtitle: ,
                            trailing: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '${productsController.items[index].price} /${productsController.items[index].unit!}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: productsController.length(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
