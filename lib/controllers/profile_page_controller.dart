import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/models/add_address_request.dart';
import 'package:thirumathikart_app/models/address.dart';
import 'package:thirumathikart_app/models/update_address_request.dart';
import 'package:thirumathikart_app/models/user.dart';
import 'package:thirumathikart_app/services/api_services.dart';
import 'package:thirumathikart_app/services/storage_services.dart';

class ProfilePageController extends GetxController {
  final api = Get.find<ApiServices>().api;
  final storageService = Get.find<StorageServices>();
  final user = User(
      userId: 1,
      firstName: 'Gopal',
      lastName: 'Ramesh',
      mobileNumber: 9876543210,
      email: 'gopalramesh@gmail.com',
      addresses: []).obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  var focusNodeAddresses = [].obs;

  final addressesValid = [
    // false,
    // false,
  ].obs;

  final addressesNew = [].obs;

  var addressesControllers = [].obs;

  final enable = {
    'First Name': false,
    'Last Name': false,
    'Mobile Number': false,
    'Email': false
  }.obs;

  final enableAddress = [].obs;

  Future<void> initialize() async {
    firstNameController.text = user.value.firstName!;
    lastNameController.text = user.value.lastName!;
    mobileNumberController.text = user.value.mobileNumber!.toString();
    emailController.text = user.value.email!;

    await api.fetchAddress(storageService).then((response) {
      user.value.addresses = [];
      addressesControllers.value = [];
      focusNodeAddresses.value = [];
      enableAddress.value = [];
      addressesValid.value = [];
      addressesNew.value = [];

      for (int i = 0; i < response.address!.length; i++) {
        final address = Address(
            id: response.address![i].id,
            line_1: response.address![i].line1,
            line_2: response.address![i].line2,
            landmark: response.address![i].landmark,
            district: response.address![i].district,
            state: response.address![i].state,
            pincode: int.tryParse(response.address![i].pincode!) ?? 0);
        addAddress(address);
        addressesControllers[i]['Line 1']!.text =
            user.value.addresses![i].line_1!;
        addressesControllers[i]['Line 2']!.text =
            user.value.addresses![i].line_2!;
        addressesControllers[i]['District']!.text =
            user.value.addresses![i].district!;
        addressesControllers[i]['State']!.text =
            user.value.addresses![i].state!;
        addressesControllers[i]['Landmark']!.text =
            user.value.addresses![i].landmark!;
        addressesControllers[i]['Pincode']!.text =
            user.value.addresses![i].pincode!.toString();
        focusNodeAddresses.add({
          'Line 1': FocusNode(),
          'Line 2': FocusNode(),
          'District': FocusNode(),
          'State': FocusNode(),
          'Landmark': FocusNode(),
          'Pincode': FocusNode(),
        });
        addressesNew.add(false);
      }
    }, onError: (err) {
      Get.snackbar('Failed to Fetch Address', err);
    });

    for (int i = 0; i < addressesControllers.length; i++) {
      addressesControllers[i]['Line 1']!.text =
          user.value.addresses![i].line_1!;
      addressesControllers[i]['Line 2']!.text =
          user.value.addresses![i].line_2!;
      addressesControllers[i]['District']!.text =
          user.value.addresses![i].district!;
      addressesControllers[i]['State']!.text = user.value.addresses![i].state!;
      addressesControllers[i]['Landmark']!.text =
          user.value.addresses![i].landmark!;
      addressesControllers[i]['Pincode']!.text =
          user.value.addresses![i].pincode!.toString();
      validateAddress(user.value.addresses![i], i);
    }
  }

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

  void updateValue(String data, String heading) {
    if (heading == 'First Name') {
      updateFirstName(data);
    } else if (heading == 'Last Name') {
      updateLastName(data);
    } else if (heading == 'Mobile Number') {
      updateMobileNumber(int.parse(data));
    } else if (heading == 'Email') {
      updateEmail(data);
    }
  }

  Future<void> addAddressRequest(Address address) async {
    var jwt = storageService.getUser();
    final addAddressRequest = AddAddressRequest(
        line1: address.line_1,
        line2: address.line_2,
        landmark: address.landmark,
        district: address.district,
        state: address.state,
        pincode: address.pincode.toString(),
        latitude: 0.0,
        longitude: 0.0,
        token: jwt);
    api.addAddress(addAddressRequest, storageService).then((response) {
      Get.snackbar('Add Address', 'Address Added successfully');
    }, onError: (err) {
      Get.snackbar('Failed to Add Address', err);
    });
  }

  Future<void> updateAddressRequest(Address address) async {
    var jwt = storageService.getUser();
    final updateAddressRequest = UpdateAddressRequest(
        id: address.id,
        line1: address.line_1,
        line2: address.line_2,
        landmark: address.landmark,
        district: address.district,
        state: address.state,
        pincode: address.pincode.toString(),
        latitude: 0.0,
        longitude: 0.0,
        token: jwt);
    api.updateAddress(updateAddressRequest, storageService).then((response) {
      Get.snackbar('Update Address', 'Address Updated Successfully');
    }, onError: (err) {
      Get.snackbar('Failed to Update Address', err);
    });
  }

  void addAddress(Address address) {
    user.value.addresses!.add(address);
    addressesControllers.add({
      'Line 1': TextEditingController(),
      'Line 2': TextEditingController(),
      'District': TextEditingController(),
      'State': TextEditingController(),
      'Landmark': TextEditingController(),
      'Pincode': TextEditingController()
    });
    enableAddress.add({
      'Line 1': false,
      'Line 2': false,
      'District': false,
      'State': false,
      'Landmark': false,
      'Pincode': false,
    });
    addressesValid.add(false);
  }

  void deleteAddress(int index) {
    addressesControllers.removeAt(index);
    user.value.addresses!.removeAt(index);
    enableAddress.removeAt(index);
    addressesValid.removeAt(index);
    addressesNew.removeAt(index);
  }

  void updateAddress(Address address, int index) {
    address.line_1 = address.line_1!.trim();
    address.line_2 = address.line_2!.trim();
    address.district = address.district!.trim();
    address.state = address.state!.trim();
    address.landmark = address.landmark!.trim();

    addressesControllers[index]['Line 1']!.text = address.line_1!;
    addressesControllers[index]['Line 2']!.text = address.line_2!;
    addressesControllers[index]['District']!.text = address.district!;
    addressesControllers[index]['State']!.text = address.state!;
    addressesControllers[index]['Landmark']!.text = address.landmark!;
    addressesControllers[index]['Pincode']!.text = address.pincode!.toString();

    if (addressesNew[index] == true) {
      user.value.addresses![index] = address;
      addAddressRequest(address);
    } else {
      address.id = user.value.addresses![index].id;
      user.value.addresses![index] = address;
      updateAddressRequest(address);
    }
  }

  void switchFlag(String key) {
    enable[key] = enable[key]! ? false : true;
  }

  void switchFlagAddress(int index) {
    enableAddress[index] = enableAddress[index]['Line 1']!
        ? {
            'Line 1': false,
            'Line 2': false,
            'District': false,
            'State': false,
            'Landmark': false,
            'Pincode': false,
          }
        : {
            'Line 1': true,
            'Line 2': true,
            'District': true,
            'State': true,
            'Landmark': true,
            'Pincode': true,
          };
  }

  bool validateName(String name, TextEditingController nameController) {
    name = name.trim();
    nameController.text = name;
    if (name != '' &&
        (name.isAlphabetOnly ||
            name.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      nameController.text = '';
      return false;
    }
  }

  bool validateMobileNumber(String mobileNumber) {
    if (mobileNumber == '') {
      return false;
    }
    mobileNumber = mobileNumber.trim();
    mobileNumberController.text = mobileNumber;
    if ((int.tryParse(mobileNumber) != null && mobileNumber.length == 10) ||
        (int.tryParse(mobileNumber.substring(1, mobileNumber.length)) != null &&
            mobileNumber.length == 13 &&
            mobileNumber[0] == '+')) {
      return true;
    } else {
      mobileNumberController.text = '';
      return false;
    }
  }

  bool validateEmailId(String emailId) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailId)) {
      return true;
    } else {
      emailController.text = '';
      return false;
    }
  }

  bool validateAddress(Address address, int index) {
    bool flag = true;
    if (address.pincode.toString().length != 6) {
      flag = false;
    }
    if (address.line_1!.trim() == '' ||
        address.landmark!.trim() == '' ||
        address.district!.trim() == '' ||
        address.state!.trim() == '') {
      flag = false;
    }
    addressesValid[index] = flag;
    return flag;
  }

  bool validate(String data, String heading) {
    if (heading == 'First Name') {
      return validateName(data, firstNameController);
    } else if (heading == 'Last Name') {
      return validateName(data, lastNameController);
    } else if (heading == 'Mobile Number') {
      return validateMobileNumber(data);
    } else if (heading == 'Email') {
      return validateEmailId(data);
    }
    return false;
  }
}
