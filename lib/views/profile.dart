import 'package:flutter/material.dart';
import 'package:thirumathikart_app/config/themes.dart';
import 'package:thirumathikart_app/controllers/profile_page_controller.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_app/controllers/home_controller.dart';
import 'package:thirumathikart_app/widgets/NavBar/nav_drawer.dart';

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profilePageController = Get.find<ProfilePageController>();
    final FocusNode focusNodefirstName = FocusNode();
    final FocusNode focusNodelastName = FocusNode();
    final FocusNode focusNodeMobileNumber = FocusNode();
    final FocusNode focusNodeEmail = FocusNode();
    final focusNodeAddresses = [];
    profilePageController.firstNameController.text =
        profilePageController.user.value.firstName!;
    profilePageController.lastNameController.text =
        profilePageController.user.value.lastName!;
    profilePageController.mobileNumberController.text =
        profilePageController.user.value.mobileNumber!.toString();
    profilePageController.emailController.text =
        profilePageController.user.value.email!;
    for (int i = 0; i < profilePageController.addressControllers.length; i++) {
      profilePageController.addressControllers[i].text =
          profilePageController.user.value.addresses![i];
      focusNodeAddresses.add(FocusNode());
    }

    return Scaffold(
      appBar: appBar('Profile'),
      drawer: const NavWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['firstName']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('firstName');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodefirstName.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('firstName');
                            profilePageController.updateFirstName(
                                profilePageController.firstNameController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateFirstName(
                            profilePageController.firstNameController.text,
                            profilePageController.firstNameController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: profilePageController.firstNameController,
                      focusNode: focusNodefirstName,
                      enabled: profilePageController.enable['firstName']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid First Name',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('firstName');
                        profilePageController.updateFirstName(
                            profilePageController.firstNameController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['lastName']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('lastName');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodelastName.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('lastName');
                            profilePageController.updateLastName(
                                profilePageController.lastNameController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateLastName(
                            profilePageController.lastNameController.text,
                            profilePageController.lastNameController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: profilePageController.lastNameController,
                      focusNode: focusNodelastName,
                      enabled: profilePageController.enable['lastName']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Last Name',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('lastName');
                        profilePageController.updateLastName(
                            profilePageController.lastNameController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['mobileNumber']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('mobileNumber');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeMobileNumber.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('mobileNumber');
                            profilePageController.updateMobileNumber(int.parse(
                                profilePageController
                                    .mobileNumberController.text));
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateMobileNumber(
                            profilePageController.mobileNumberController.text,
                            profilePageController.mobileNumberController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: profilePageController.mobileNumberController,
                      focusNode: focusNodeMobileNumber,
                      enabled: profilePageController.enable['mobileNumber']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Mobile Number',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('mobileNumber');
                        profilePageController.updateMobileNumber(int.parse(
                            profilePageController.mobileNumberController.text));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Email ID',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['email']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('email');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeEmail.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('email');
                            profilePageController.updateEmail(
                                profilePageController.emailController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateEmailId(
                            profilePageController.emailController.text,
                            profilePageController.emailController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: profilePageController.emailController,
                      focusNode: focusNodeEmail,
                      enabled: profilePageController.enable['email']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Email ID',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('email');
                        profilePageController.updateEmail(
                            profilePageController.emailController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
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
                      profilePageController.addAddress('');
                      focusNodeAddresses.add(FocusNode());
                      profilePageController
                          .switchFlagAddress(focusNodeAddresses.length - 1);
                      Future.delayed(
                          const Duration(milliseconds: 0),
                          focusNodeAddresses[focusNodeAddresses.length - 1]
                              .requestFocus);
                      profilePageController
                          .addressControllers[
                              profilePageController.addressControllers.length -
                                  1]
                          .text = profilePageController
                              .user.value.addresses![
                          profilePageController.addressControllers.length - 1];
                    },
                    icon: const Icon(Icons.add),
                    color: AppTheme.smallButton,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Obx(
              () => SizedBox(
                height: 600,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () {},
                    child: Obx(
                      () => Column(
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
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => !profilePageController
                                              .enableAddress[index]
                                          ? IconButton(
                                              onPressed: () {
                                                profilePageController
                                                    .switchFlagAddress(index);
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100),
                                                    focusNodeAddresses[index]
                                                        .requestFocus);
                                              },
                                              icon: const Icon(Icons.edit),
                                              color: AppTheme.chakra,
                                              iconSize: 20,
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                profilePageController
                                                    .switchFlagAddress(index);
                                                profilePageController
                                                    .updateAddress(
                                                        profilePageController
                                                            .addressControllers[
                                                                index]
                                                            .text,
                                                        index);
                                              },
                                              icon: const Icon(
                                                  Icons.check_rounded),
                                              color: AppTheme.facebook,
                                              iconSize: 25,
                                            ),
                                    ),
                                    IconButton(
                                      onPressed: () => {
                                        profilePageController
                                            .deleteAddress(index),
                                        focusNodeAddresses.removeAt(index),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 5),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppTheme.searchBar,
                                border: validateAddress(
                                        profilePageController
                                            .addressControllers[index].text,
                                        profilePageController
                                            .addressControllers[index])
                                    ? Border.all(
                                        color: AppTheme.searchBar,
                                        width: 2,
                                      )
                                    : Border.all(
                                        color: AppTheme.bin,
                                        width: 2,
                                      ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: TextField(
                                  keyboardType: TextInputType.streetAddress,
                                  controller: profilePageController
                                      .addressControllers[index],
                                  focusNode: focusNodeAddresses[index],
                                  enabled: profilePageController
                                      .enableAddress[index],
                                  decoration: const InputDecoration(
                                    hintText: 'Enter valid Address',
                                    border: InputBorder.none,
                                  ),
                                  maxLines: null,
                                  onSubmitted: (string) {
                                    profilePageController
                                        .switchFlagAddress(index);
                                    profilePageController.updateAddress(
                                        profilePageController
                                            .addressControllers[index].text,
                                        index);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: profilePageController.addressControllers.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateFirstName(String firstName, TextEditingController controller) {
    firstName = firstName.trim();
    controller.text = firstName;
    if (firstName != '' &&
        (firstName.isAlphabetOnly ||
            firstName.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateLastName(String lastName, TextEditingController controller) {
    lastName = lastName.trim();
    controller.text = lastName;
    if (lastName != '' &&
        (lastName.isAlphabetOnly ||
            lastName.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateMobileNumber(
      String mobileNumber, TextEditingController controller) {
    if (mobileNumber == '') {
      return false;
    }
    mobileNumber = mobileNumber.trim();
    controller.text = mobileNumber;
    if ((int.tryParse(mobileNumber) != null && mobileNumber.length == 10) ||
        (int.tryParse(mobileNumber.substring(1, mobileNumber.length)) != null &&
            mobileNumber.length == 13 &&
            mobileNumber[0] == '+')) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateEmailId(String emailId, TextEditingController controller) {
    emailId = emailId.trim();
    controller.text = emailId;
    int indexAT =
        emailId.length - emailId.split('').reversed.join().indexOf('@') - 1;
    int indexDot =
        emailId.length - emailId.split('').reversed.join().indexOf('.') - 1;
    if (indexAT != -1 && indexDot != -1 && indexDot > indexAT) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateAddress(String address, TextEditingController controller) {
    address = address.trim();
    controller.text = address;
    if (address != '') {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }
}
