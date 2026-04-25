import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/localization/change_local.dart';
import '../../core/services/notification/notification_helper.dart';

class SettingsContoller extends GetxController {
  late String language;
  bool notifactionSwitch = false;
  MyServices myServices = Get.find();
  var languageController = Get.put(LocaleController());
  var currentLang = (Get.locale?.languageCode ?? "en").obs;

  logOut() {
    Get.defaultDialog(
      title: "54".tr,
      middleText: "logout_confirm".tr,
      onConfirm: () {
        myServices.sharedPreferences.setString('step', 'onboarding');
        // NotificationsHelper.firebaseMessaging.unsubscribeFromTopic('users');
        Get.offAllNamed(AppRoute.login);
      },
      onCancel: () {},
      textConfirm: "yes".tr,
      textCancel: "no".tr,
      confirmTextColor: Colors.white,
      buttonColor: AppColor.primaryColor,
    );
  }

  goToAddressPage() {
    Get.toNamed(AppRoute.addressView);
  }

  phoneCall() {
    launchUrl(Uri.parse('tel:+201113809492'));
  }

  diableNotification() {
    if (notifactionSwitch) {
      NotificationsHelper.firebaseMessaging.unsubscribeFromTopic('users');
    } else {
      NotificationsHelper.firebaseMessaging.subscribeToTopic('users');
    }
    print(
        '////////////////////////////////////////////////////////////////////');
    print(notifactionSwitch);
    print(
        '////////////////////////////////////////////////////////////////////');
    update();
  }

  changeLang() {
    showLanguageBottomSheet();
  }

  void showLanguageBottomSheet() {
    currentLang.value = Get.locale?.languageCode ?? "en";
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "choose_language".tr,
                style: Get.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      currentLang.value; // Access to trigger rebuild
                      return _buildLanguageCard(
                        label: "language_arabic".tr,
                        subtitle: "arabic_subtitle".tr,
                        flag: "🇸🇦",
                        isSelected: Get.locale?.languageCode == 'ar',
                        onTap: () {
                          languageController.chnageLang('ar');
                          currentLang.value = 'ar';
                          Get.back();
                        },
                      );
                    }),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Obx(() {
                      currentLang.value; // Access to trigger rebuild
                      return _buildLanguageCard(
                        label: "language_english".tr,
                        subtitle: "english_subtitle".tr,
                        flag: "🇬🇧",
                        isSelected: Get.locale?.languageCode == 'en',
                        onTap: () {
                          languageController.chnageLang('en');
                          currentLang.value = 'en';
                          Get.back();
                        },
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  Widget _buildLanguageCard({
    required String label,
    required String subtitle,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primaryColor.withOpacity(0.1)
              : Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(flag, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.check_circle,
                    color: AppColor.primaryColor, size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
