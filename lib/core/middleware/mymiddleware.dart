import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
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
