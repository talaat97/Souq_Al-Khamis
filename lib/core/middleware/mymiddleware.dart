import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  //int? get Priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "Auth") {
      print('--------------------فهمك عمتا !! --------------------------');
      return const RouteSettings(name: AppRoute.home);
    }

    if (myServices.sharedPreferences.getString("step") == "onboarding") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
