import 'package:e_comerse_app/core/constant/themes.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData appTheme = themeEnglish;
  MyServices myServices = Get.find();

  chnageLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requstPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('OPPS!', 'You need to enable location service..');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('OPPS!', 'You need to enable location in apps ');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar('Ok Asshole !!!', 'You cant open the application');
    }
  }

  @override
  void onInit() {
    requstPerLocation();
    String? langOfRefrence = myServices.sharedPreferences.getString("lang");
    if (langOfRefrence == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (langOfRefrence == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = language!.languageCode == 'ar' ? themeArabic : themeEnglish;
    }

    super.onInit();
  }
}
