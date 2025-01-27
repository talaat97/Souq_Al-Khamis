import 'package:e_comerse_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/onboarding/button.dart';
import '../widgets/onboarding/dot_controller.dart';
import '../widgets/onboarding/slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerTmp());
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: CutomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CutomControllerOnBoarding(),
                    Spacer(flex: 2),
                    CutomButtonOnBoarding(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
