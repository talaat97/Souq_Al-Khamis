import 'package:souq_al_khamis/core/constant/routs_page.dart';
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
