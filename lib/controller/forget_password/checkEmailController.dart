import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/data/datasourse/remote/Auth/forget_password/check_email_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

abstract class CheckPasswordController extends GetxController {
  emailCheck();
}

class CheckPasswordControllerImp extends CheckPasswordController {
  late TextEditingController email;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest? statusRequest;
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  emailCheck() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      // print(' login Contorller page ============================= $response');
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCodeCheckEmail, arguments: {
            'email':email.text,
          });
          print(
              'the email that is send ========================================${email.text}');
        } else {
          Get.defaultDialog(
              title: 'OPPPS!',
              middleText: "looks like you this accoutn didnt exist !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
