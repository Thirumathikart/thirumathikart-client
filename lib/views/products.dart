import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class Products extends GetView<ProductsController> {
  const Products({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();
    final productsListMain = Get.arguments;
    controller.getProductsByCategory('Food', true);
    final FocusNode focusNode = FocusNode();
    if (productsController.flag.value) {
      productsController.copy(productsListMain);
      productsController.switchFlag();
    }
    return Scaffold(
      appBar: appBar(productsListMain[0].parentName!),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: AppTheme.searchBar,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Search : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
                                productsController.productsListDynamic.toList(),
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
                      left: 4,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Obx(
                        () => ToggleButtons(
                          borderColor: AppTheme.selected,
                          fillColor: AppTheme.unSelected,
                          borderWidth: 2,
                          selectedBorderColor: AppTheme.selected,
                          selectedColor: AppTheme.textSecondary,
                          borderRadius: BorderRadius.circular(0),
                          onPressed: (int index) {
                            if (index == 0) {
                              controller.getProductsByCategory('Food', true);
                              controller.set(0, true);
                            } else {
                              controller.getProductsByCategory('Food', false);
                              controller.set(1, false);
                            }
                            for (int i = 0;
                                i < controller.isSelected.length;
                                i++) {
                              controller.set(i, i == index);
                            }
                          },
                          isSelected: controller.isSelected,
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
          Expanded(
              child: controller.obx((state) => ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: [
                      Card(
                        elevation: 0.2,
                        child: GestureDetector(
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
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppTheme.card,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                child: ListTile(
                                  leading: CachedNetworkImage(
                                    imageUrl: state![index].productPhoto!,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),

                                  title: SizedBox(
                                    child: Text(
                                      state[index].productTitle!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  //subtitle: ,
                                  trailing: SizedBox(
                                    child: Text(
                                      '₹ ${state[index].productPrice}/kg',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      maxLines: 100,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ]),
                    shrinkWrap: true,
                    itemCount: state!.length,
                  ))),
        ],
      ),
    );
  }
}
