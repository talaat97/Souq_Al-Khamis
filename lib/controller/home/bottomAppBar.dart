import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/view/screens/home/offer_Page.dart';
import 'package:souq_al_khamis/view/screens/order/orders.dart';
import 'package:souq_al_khamis/view/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/home/setting_page.dart';

abstract class BottomNavBarController extends GetxController {
  changePage(int i);
}

class BottomNavBarControllerImp extends BottomNavBarController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const OrdersPage(),
    const OfferPage(),
    const SettingPage(),
  ];
  List titlePage = [
    {
      "title": '45'.tr,
      "icon": Icons.home,
    },
    {
      "title": '46'.tr,
      "icon": Icons.shopping_cart,
    },
    {
      "title": '47'.tr,
      "icon": Icons.local_offer_outlined,
    },
    {
      "title": '48'.tr,
      "icon": Icons.settings,
    },
  ];

  goToCartPage() {
    Get.toNamed(AppRoute.cart);
  }

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
