import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/data/datasourse/remote/Auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

abstract class SignUpCotroller extends GetxController {
  signUp();
  goToLogein();
}

class SignUpControllerImp extends SignUpCotroller {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  GlobalKey<FormState> signUpkey = GlobalKey<FormState>();

  SignupData signupData = SignupData(Get.find());
  List data = [];

  StatusRequest? statusRequest;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  signUp() async {
    if (signUpkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        email.text,
        password.text,
        phone.text,
      );
      statusRequest = handlingData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoute.verfiyCodeSignup, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: 'OPPPS!',
              middleText: "looks like this email or phone exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return;
    }
  }

  @override
  goToLogein() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
