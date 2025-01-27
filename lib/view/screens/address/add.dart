import 'package:e_comerse_app/controller/address/addController.dart';
import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:e_comerse_app/view/widgets/address/CustomBottomShet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/address/CustomMap.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressEditController pageController = Get.put(AddressEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('New address'),
      ),
      body: GetBuilder<AddressEditController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              if (pageController.kGooglePlex != null)
                const Expanded(
                  child: Stack(
                    children: [
                      CustomMap(),
                      CustombottomShet(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
