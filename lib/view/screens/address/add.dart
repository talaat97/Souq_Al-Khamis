import 'package:souq_al_khamis/controller/address/addController.dart';
import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:souq_al_khamis/view/widgets/address/CustomBottomShet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/address/CustomMap.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressEditController pageController = Get.put(AddressEditController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('New Address'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
