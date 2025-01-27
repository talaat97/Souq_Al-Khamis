import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:e_comerse_app/core/function/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/change_local.dart';

class SettingsContoller extends GetxController {
  late String language;
  MyServices myServices = Get.find();
  var languageController = Get.put(LocaleController());
  logOut() {
    myServices.sharedPreferences.setString('step', 'onboarding');
    NotificationsHelper.firebaseMessaging.unsubscribeFromTopic('users');
    Get.offAllNamed(AppRoute.login);
  }

  goToAddressPage() {
    Get.toNamed(AppRoute.addressView);
  }

  changeLang() {
    Get.dialog(
      AlertDialog(
        title: const Text('Change language'),
        content: const Text('chooce between to language'),
        actions: [
          TextButton(
            child: const Text("Arapic"),
            onPressed: () {
              languageController.chnageLang('ar');
              Get.back();
            },
          ),
          TextButton(
            child: const Text("English"),
            onPressed: () {
              languageController.chnageLang('en');
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
