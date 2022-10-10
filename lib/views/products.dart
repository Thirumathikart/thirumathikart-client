// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/views/product_detail.dart';

class Products extends StatefulWidget {
  late List<Product> products_list;
  Products(this.products_list);

  @override
  _Products createState() => _Products(products_list);
}

class _Products extends State<Products> {
  late List<Product> products_list_main;
  _Products(this.products_list_main);
  late List<Product> products_list;
  late List<bool> isSelected;
  late FocusNode focusNode;
  late Icon customIcon;
  late Widget customSearchBar;

  @override
  void initState() {
    isSelected = [true, false];
    products_list = products_list_main;
    focusNode = FocusNode();
    customIcon = const Icon(Icons.search);
    customSearchBar = Text(
      products_list_main[0].parentName!,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: customSearchBar,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.home,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = ListTile(
                        title: TextField(
                          showCursor: true,
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          cursorHeight: 20,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          focusNode: focusNode,
                          onChanged: (text) {
                            products_list = [];
                            for (int i = 0;
                                i < products_list_main.length;
                                i++) {
                              if (products_list_main[i]
                                  .name!
                                  .toLowerCase()
                                  .contains(text)) {
                                products_list.add(products_list_main[i]);
                              }
                            }
                            if (isSelected[0] == false &&
                                isSelected[1] == true) {
                              products_list = products_list.reversed.toList();
                            }
                          },
                        ),
                      );
                      focusNode.requestFocus();
                    } else {
                      customIcon = const Icon(Icons.search);
                      customSearchBar = Text(
                        products_list_main[0].parentName!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      products_list = products_list_main;
                      if (isSelected[0] == false && isSelected[1] == true) {
                        products_list = products_list.reversed.toList();
                      }
                    }
                  });
                },
                icon: customIcon,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          ToggleButtons(
                            borderColor: Colors.black,
                            fillColor: Colors.grey,
                            borderWidth: 2,
                            selectedBorderColor: Colors.black,
                            selectedColor: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < isSelected.length; i++) {
                                  isSelected[i] = i == index;
                                }
                                if (isSelected[0] == false &&
                                    isSelected[1] == true) {
                                  products_list =
                                      products_list.reversed.toList();
                                }
                                if (isSelected[1] == false &&
                                    isSelected[0] == true) {
                                  products_list =
                                      products_list.reversed.toList();
                                }
                              });
                            },
                            isSelected: isSelected,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Product_Detail(products_list[index])));
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
                            image: AssetImage(products_list[index].image!),
                            fit: BoxFit.fill,
                          ),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  products_list[index].name!,
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
                                  '${products_list[index].price} /${products_list[index].unit!}',
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
                  itemCount: products_list.length,
                ),
              ),
            ],
          ),
        ),
      );
}
