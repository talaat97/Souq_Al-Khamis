import 'package:souq_al_khamis/controller/on_boarding_controller.dart';
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
                margin: const EdgeInsetsDirectional.only(start: 5),
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
