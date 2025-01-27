import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:e_comerse_app/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
}

class OnBoardingControllerTmp extends OnBoardingController {
  MyServices myServices = Get.find();
  late PageController pageController;
  int currentIndex = 0;
  @override
  next() {
    currentIndex++;
    //set key to know if he saw onboarding sreen 
    myServices.sharedPreferences.setString("step", "onboarding");
    if (currentIndex > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
