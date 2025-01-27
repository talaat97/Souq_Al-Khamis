import 'package:e_comerse_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasourse/static/static.dart';

class CutomSliderOnBoarding extends GetView<OnBoardingControllerTmp> {
  const CutomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (val) {
        controller.onPageChange(val);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                onBoardingList[index].image!,
               height: 300,
              ),
              const SizedBox(height: 20),
              Text(
                onBoardingList[index].title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 40),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  )),
            ],
          ),
        );
      },
    );
  }
}
