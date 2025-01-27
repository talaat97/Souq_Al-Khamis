import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/localization/change_local.dart';
import 'package:e_comerse_app/view/widgets/language/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('1'.tr, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            CuttomButtonOfLang(
              nameLang: 'English',
              onPressed: () {
                controller.chnageLang("en");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
            const SizedBox(height: 10),
            CuttomButtonOfLang(
              nameLang: 'عربي',
              onPressed: () {
                controller.chnageLang("ar");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
