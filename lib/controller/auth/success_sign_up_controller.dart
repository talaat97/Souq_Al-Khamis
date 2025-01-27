import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogein();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogein() {
    Get.offAllNamed(AppRoute.login);
  }
}
