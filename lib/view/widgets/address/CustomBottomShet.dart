import 'package:e_comerse_app/view/widgets/address/CustombuttonAddress.dart';
import 'package:e_comerse_app/view/widgets/auth/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addController.dart';
import '../../../core/function/valild.dart';

AddressEditController pageController = Get.put(AddressEditController());

class CustombottomShet extends StatelessWidget {
  const CustombottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CustombuttonAddress(
          text: 'Contuine',
          onTap: () {
            if (pageController.latLng != null) {
              Get.bottomSheet(
                backgroundColor: Colors.white,
                Form(
                  key: pageController.addreessKey,
                  child: ListView(
                    padding: const EdgeInsets.all(15),
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'details',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                          hintText: 'enter name of addrees',
                          labelText: 'Name',
                          myController: pageController.name,
                          myIcon: Icons.location_pin,
                          valid: (val) {
                            return checkVaild(val!, 3, 100, 'password');
                          }),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: 'enter city ',
                        labelText: 'City',
                        myController: pageController.city,
                        myIcon: Icons.location_city,
                        valid: (val) {
                          return checkVaild(val!, 5, 100, 'password');
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: 'enter street',
                        labelText: 'Street',
                        myController: pageController.street,
                        myIcon: Icons.store_mall_directory_outlined,
                        valid: (val) {
                          return checkVaild(val!, 5, 100, 'password');
                        },
                      ),
                      const SizedBox(height: 20),
                      CustombuttonAddress(
                        text: 'Add',
                        onTap: () {
                          pageController.saveAddress();
                        },
                      ),
                    ],
                  ),
                ),
                barrierColor: Colors.black.withOpacity(0.5), // Optional
                isDismissible: true,
                enableDrag: false,
              );
            } else {
              Get.showSnackbar(const GetSnackBar(
                title: 'OPPS',
                message: 'Shoose location ',
                duration: Duration(seconds: 2),
              ));
            }
          }),
    );
  }
}
