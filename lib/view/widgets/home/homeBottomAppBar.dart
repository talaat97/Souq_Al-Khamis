import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/core/function/alert.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomButtonAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/bottomAppBar.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var homeBottomNavBar = Get.put(BottomNavBarControllerImp());
    return GetBuilder<BottomNavBarControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(60)),
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.grey200,
          onPressed: () {
            homeBottomNavBar.goToCartPage();
          },
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomButtonbar(),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: exitAlert,
            child: controller.listPage.elementAt(controller.currentPage)),
      ),
    );
  }
}
