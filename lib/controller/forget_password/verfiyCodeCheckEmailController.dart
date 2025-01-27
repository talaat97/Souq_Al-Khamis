import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:get/get.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/datasourse/remote/Auth/forget_password/verfiy_code_check_email_data.dart';

abstract class VerfiyCodeCheckEmailController extends GetxController {
  goToResetPassword(String verfiyCodeSignup);
}

class VerfiyCodeCheckEmailControllerImp extends VerfiyCodeCheckEmailController {
  VerfiyCodeCheckEmailData verfiyCodeCheckEmailData =
      VerfiyCodeCheckEmailData(Get.find());
  late String email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    print(
        'the email comes form checkEmailpage to VerfiyCodeCheckEmail ========================================$email');
    super.onInit();
  }

  StatusRequest? statusRequest;

  @override
  goToResetPassword(verfiyCodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verfiyCodeCheckEmailData.postData(
      email,
      verfiyCodeSignup,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {
          'email': email,
        });
      } else {
        Get.defaultDialog(
            title: 'OPPPS!',
            middleText: "looks like vefriy code is Not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
