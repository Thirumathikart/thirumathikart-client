import 'package:flutter/material.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/profile_page_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/address.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_drawer.dart';
import 'package:thirumathikart_app/widgets/card/profile_address_card.dart';
import 'package:thirumathikart_app/widgets/card/profile_card.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfilePageController());

    final FocusNode focusNodeFirstName = FocusNode();
    final FocusNode focusNodeLastName = FocusNode();
    final FocusNode focusNodeMobileNumber = FocusNode();
    final FocusNode focusNodeEmail = FocusNode();

    controller.initialize();

    return Scaffold(
      //appBar: appBar('Profile'),
      drawer: const NavWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              controller,
              focusNodeFirstName,
              'First Name',
              TextInputType.name,
              controller.firstNameController,
            ),
            ProfileCard(
              controller,
              focusNodeLastName,
              'Last Name',
              TextInputType.name,
              controller.lastNameController,
            ),
            ProfileCard(
              controller,
              focusNodeMobileNumber,
              'Mobile Number',
              TextInputType.phone,
              controller.mobileNumberController,
            ),
            ProfileCard(
              controller,
              focusNodeEmail,
              'Email',
              TextInputType.emailAddress,
              controller.emailController,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addressesNew.add(true);
                      controller.addAddress(Address(
                        line_1: '',
                        line_2: '',
                        landmark: '',
                        district: '',
                        state: '',
                        pincode: 0,
                      ));
                      controller.focusNodeAddresses.add({
                        'Line 1': FocusNode(),
                        'Line 2': FocusNode(),
                        'District': FocusNode(),
                        'State': FocusNode(),
                        'Landmark': FocusNode(),
                        'Pincode': FocusNode(),
                      });
                      controller.switchFlagAddress(
                          controller.focusNodeAddresses.length - 1);
                      Future.delayed(
                          const Duration(milliseconds: 100),
                          () => {
                                controller.focusNodeAddresses[
                                        controller.focusNodeAddresses.length -
                                            1]['Line 1']
                                    .requestFocus(),
                              });
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['Line 1']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .line_1!;
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['Line 2']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .line_2!;
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['District']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .district!;
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['State']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .state!;
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['Landmark']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .landmark!;
                      controller
                              .addressesControllers[
                                  controller.addressesControllers.length - 1]
                                  ['Pincode']!
                              .text =
                          controller
                              .user
                              .value
                              .addresses![
                                  controller.addressesControllers.length - 1]
                              .pincode!
                              .toString();
                    },
                    icon: const Icon(Icons.add),
                    color: AppTheme.smallButton,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) => Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: controller.addressesValid[index]
                            ? Border.all(
                                color: AppTheme.searchBar,
                                width: 3,
                              )
                            : Border.all(
                                color: AppTheme.bin,
                                width: 3,
                              ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address - ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => !controller.enableAddress[index]
                                              ['Line 1']!
                                          ? IconButton(
                                              onPressed: () {
                                                controller
                                                    .switchFlagAddress(index);
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100),
                                                    () => {
                                                          controller
                                                              .focusNodeAddresses[
                                                                  index]
                                                                  ['Line 1']
                                                              .requestFocus(),
                                                        });
                                              },
                                              icon: const Icon(Icons.edit),
                                              color: AppTheme.chakra,
                                              iconSize: 20,
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                final address = Address(
                                                  line_1: controller
                                                      .addressesControllers[
                                                          index]['Line 1']!
                                                      .text,
                                                  line_2: controller
                                                      .addressesControllers[
                                                          index]['Line 2']!
                                                      .text,
                                                  state: controller
                                                      .addressesControllers[
                                                          index]['State']!
                                                      .text,
                                                  landmark: controller
                                                      .addressesControllers[
                                                          index]['Landmark']!
                                                      .text,
                                                  pincode: int.tryParse(controller
                                                          .addressesControllers[
                                                              index]['Pincode']!
                                                          .text
                                                          .trim()) ??
                                                      0,
                                                  district: controller
                                                      .addressesControllers[
                                                          index]['District']!
                                                      .text,
                                                );
                                                if (controller.validateAddress(
                                                    address, index)) {
                                                  controller.updateAddress(
                                                      address, index);
                                                  controller
                                                      .switchFlagAddress(index);
                                                } else {
                                                  Get.snackbar(
                                                      'Invalid Address',
                                                      'Address - ${index + 1} is invalid.');
                                                }
                                              },
                                              icon: const Icon(
                                                  Icons.check_rounded),
                                              color: AppTheme.facebook,
                                              iconSize: 25,
                                            ),
                                    ),
                                    IconButton(
                                      onPressed: () => {
                                        controller.deleteAddress(index),
                                        controller.focusNodeAddresses
                                            .removeAt(index),
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: AppTheme.bin,
                                      iconSize: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['Line 1']!,
                            'Line 1',
                            TextInputType.multiline,
                            controller.addressesControllers[index]['Line 1']!,
                            index,
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['Line 2']!,
                            'Line 2',
                            TextInputType.multiline,
                            controller.addressesControllers[index]['Line 2']!,
                            index,
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['Landmark']!,
                            'Landmark',
                            TextInputType.multiline,
                            controller.addressesControllers[index]['Landmark']!,
                            index,
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['District']!,
                            'District',
                            TextInputType.name,
                            controller.addressesControllers[index]['District']!,
                            index,
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['State']!,
                            'State',
                            TextInputType.name,
                            controller.addressesControllers[index]['State']!,
                            index,
                          ),
                          ProfileAddressCard(
                            controller,
                            controller.focusNodeAddresses[index]['Pincode']!,
                            'Pincode',
                            TextInputType.number,
                            controller.addressesControllers[index]['Pincode']!,
                            index,
                          ),
                          const Padding(padding: EdgeInsets.all(10))
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: controller.addressesControllers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
