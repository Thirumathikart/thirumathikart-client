import 'package:flutter/material.dart';
import 'package:thirumathikart_app/controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class Products extends GetView<ProductsController> {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();
    final productsListMain = Get.arguments;
    final FocusNode focusNode = FocusNode();
    if (productsController.flag.value) {
      productsController.copy(productsListMain);
      productsController.switchFlag();
    }
    return Scaffold(
      appBar: appBar(productsListMain[0].parentName!),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: productsListMain[0].color,
                    borderRadius: BorderRadius.circular(15)),
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
                            if (productsListMain[i]
                                .name!
                                .toLowerCase()
                                .contains(
                                    productsController.textController.text)) {
                              productsController.add(
                                  productsController.productsListDynamic
                                      .toList(),
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
                            fillColor: productsListMain[0].color,
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
                        Get.toNamed('/productDetail', arguments: [
                          productsController.productsListDynamic[index],
                          productsListMain
                        ]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 3,
                          bottom: 3,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: productsListMain[0].color,
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            color: productsListMain[0].color,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              child: ListTile(
                                leading: Image(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 100,
                                  image: AssetImage(productsController
                                      .productsListDynamic[index].image!),
                                  fit: BoxFit.fill,
                                ),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        productsController
                                            .productsListDynamic[index].name!,
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
                                        '₹ ${productsController.productsListDynamic[index].price} /${productsController.productsListDynamic[index].unit!}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                        maxLines: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
