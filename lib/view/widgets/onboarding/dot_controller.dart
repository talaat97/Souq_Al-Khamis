import 'package:e_comerse_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../data/datasourse/static/static.dart';

class CutomControllerOnBoarding extends StatelessWidget {
  const CutomControllerOnBoarding({super.key});

  @override
  Widget build(context) {
    return GetBuilder<OnBoardingControllerTmp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: controller.currentIndex == index ? 20 : 6,
                height: 6,
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
