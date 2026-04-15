import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/notification/notification_helper.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:souq_al_khamis/data/datasourse/remote/Auth/login_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';


abstract class LogeinCotroller extends GetxController {
  login();
  goToSignUp();
  goToForgetpassword();
}

class LogeinControllerImp extends LogeinCotroller {
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isShowPassword = false;
  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest;
  String? deviseToken;

  @override
  login() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      // Get the stored FCM token (or fallback to fetching a new one)
    
      var response = await loginData.postData(
        email.text,
        password.text,
        deviseToken ?? '',
      );
      statusRequest = handlingData(response);
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == "success" &&
            response['data']['users_approve'] == "1") {
          myServices.sharedPreferences
              .setString('id', response['data']['user_id']);
          myServices.sharedPreferences
              .setString('username', response['data']['user_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['user_email']);
          myServices.sharedPreferences
              .setString('phone', response['data']['user_phone']);
          myServices.sharedPreferences.setString('step', 'Auth');

          Get.offNamed(AppRoute.home);
        }
        if (response['status'] == "success" &&
            response['data']['users_approve'] == "0") {
          Get.toNamed(AppRoute.verfiyCodeSignup, arguments: {
            'email': email.text,
          });
        }
        if (response['status'] == "failure") {
          Get.defaultDialog(
              title: 'OPPPS!',
              middleText: "looks like you dont have account yet!");
          statusRequest = StatusRequest.failure;
        }
      } else {
        Get.defaultDialog(
            title: 'OPPPS!', middleText: "looks like server error!");
      }

      update();
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    deviseToken = await NotificationsHelper.firebaseMessaging.getToken();
    super.onInit();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetpassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
