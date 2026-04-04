import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/on_boarding_controller.dart';
import '../shared/app_button.dart';

class CutomButtonOnBoarding extends GetView<OnBoardingControllerTmp> {
  const CutomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 40),
      child: AppButton(
        text: '8'.tr, // 🐛 BUG FIX: Replaced hardcoded 'next' with translation key '8' which usually maps to "Continue"
        onPressed: () {
          controller.next();
        },
      ),
    );
  }
}
