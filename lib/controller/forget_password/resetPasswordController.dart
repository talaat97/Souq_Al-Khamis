import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/datasourse/remote/Auth/forget_password/reset_password_data.dart';

abstract class ResetPasswordController extends GetxController {
  newPasswordCheck();
  goToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;
  late String email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  newPasswordCheck() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "warning ", middleText: "password not match");
    }
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email,
        password.text,
      );
      statusRequest = handlingData(response);
      // print(' login Contorller page ============================= $response');
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: 'OPPPS!', middleText: "Try agin please");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSuccessPassword() {}
}
