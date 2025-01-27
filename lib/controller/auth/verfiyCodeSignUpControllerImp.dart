import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/data/datasourse/remote/Auth/veryfiyCodeSignup_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verfiyCodeSignup);
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  VerfiyCodeCheckEmailData verfiyCodeSignupData =
      VerfiyCodeCheckEmailData(Get.find());

  late String email;
  StatusRequest? statusRequest;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToSuccessSignUp(verfiyCodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verfiyCodeSignupData.postData(
      email,
      verfiyCodeSignup,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: 'OPPPS!',
            middleText: "looks like vefriy code is Not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend() {
    verfiyCodeSignupData.sendData(
      email,
    );
  }
}
