import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/on_boarding_controller.dart';
import '../../../core/constant/colors.dart';

class CutomButtonOnBoarding extends GetView<OnBoardingControllerTmp> {
  const CutomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(bottom: 40),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: const Text(
          'next',
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
