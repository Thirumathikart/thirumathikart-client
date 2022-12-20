import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/profile_page_controller.dart';

class ProfileAddressCard extends GetView {
  @override
  final ProfilePageController controller;

  final FocusNode focusNode;
  final String subHeading;
  final TextInputType keyboard;
  final TextEditingController editingController;
  final int index;

  const ProfileAddressCard(this.controller, this.focusNode, this.subHeading,
      this.keyboard, this.editingController, this.index,
      {super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 25, 10),
                child: Text(
                  subHeading,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 20),
              //   child: Obx(
              //     () => controller.enableAddress[index][subHeading]!
              //         ? IconButton(
              //             onPressed: () {
              //               controller.switchFlagAddress(index);
              //               Future.delayed(const Duration(milliseconds: 100),
              //                   focusNode.requestFocus);
              //             },
              //             icon: const Icon(Icons.edit),
              //             color: AppTheme.chakra,
              //             iconSize: 18,
              //           )
              //         : IconButton(
              //             onPressed: () {
              //               controller.switchFlagAddress(index);
              //               controller.updateAddress(
              //                 editingController.text,
              //                 subHeading,
              //               );
              //             },
              //             icon: const Icon(Icons.check_rounded),
              //             color: AppTheme.facebook,
              //             iconSize: 25,
              //           ),
              //   ),
              // ),
            ],
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.searchBar,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    keyboardType: keyboard,
                    controller: editingController,
                    focusNode: focusNode,
                    enabled: controller.enableAddress[index][subHeading]!,
                    decoration: InputDecoration(
                      hintText: 'Enter valid $subHeading',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: null,
                    onSubmitted: (string) {},
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
        ],
      );
}
