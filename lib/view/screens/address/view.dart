import 'package:e_comerse_app/controller/address/viewController.dart';
import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/address/CustombuttonAddress.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (pageController) => HandlingDataView(
          statusRequest: pageController.statusRequest,
          widget: const LocationThemeCart(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.goToAddAddress();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LocationThemeCart extends StatelessWidget {
  const LocationThemeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(ViewAddressController());
    return GetBuilder<ViewAddressController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              pageController.addresses.length,
              (index) => Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.thirdColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pageController.addresses[index].addressName!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: AppColor.black),
                              ),
                              Text(
                                pageController.addresses[index].addressCity!,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                pageController.addresses[index].addressStreet!,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const Icon(
                                size: 80,
                                Icons.location_pin,
                                color: AppColor.primaryColor,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      pageController.deleteAddress(
                                          pageController
                                              .addresses[index].addressId);
                                    },
                                    icon: const Icon(
                                      size: 30,
                                      Icons.delete_outline,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  CustombuttonAddress(
                                    text: 'Edit',
                                    onTap: () {
                                      pageController.goToEditAddress(
                                          pageController.addresses[index]);
                                    },
                                    heightOfButoon: 40,
                                    widthOfButoon: 100,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
