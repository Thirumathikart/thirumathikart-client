import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/user.dart';

class ProfilePageController extends GetxController {
  final user = User(
      userId: 1,
      firstName: 'Gopal',
      lastName: 'Ramesh',
      mobileNumber: 9876543210,
      email: 'gopalramesh@gmail.com',
      addresses: ['Dubai Main Road\nDubai', 'Chennai Main Road\nChennai']).obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final addressControllers = [
    TextEditingController(),
    TextEditingController(),
  ].obs;

  final enable = {
    'firstName': false,
    'lastName': false,
    'mobileNumber': false,
    'email': false
  }.obs;
  final enableAddress = [
    false,
    false,
  ].obs;

  void updateFirstName(String firstName) {
    user.value.firstName = firstName;
  }

  void updateLastName(String lastName) {
    user.value.lastName = lastName;
  }

  void updateMobileNumber(int mobileNumber) {
    user.value.mobileNumber = mobileNumber;
  }

  void updateEmail(String email) {
    user.value.email = email;
  }

  void addAddress(String address) {
    user.value.addresses!.add(address);
    addressControllers.add(TextEditingController());
    enableAddress.add(false);
  }

  void deleteAddress(int index) {
    addressControllers.removeAt(index);
    user.value.addresses!.removeAt(index);
    enableAddress.removeAt(index);
  }

  void updateAddress(String address, int index) {
    user.value.addresses![index] = address;
  }

  void switchFlag(String key) {
    enable[key] = enable[key]! ? false : true;
  }

  void switchFlagAddress(int index) {
    enableAddress[index] = enableAddress[index] ? false : true;
  }
}
