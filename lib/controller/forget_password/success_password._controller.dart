import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:get/get.dart';

abstract class SuccessPasswordController extends GetxController {
  goToLogin();
}

class SuccessPasswordControllerImp extends SuccessPasswordController {
  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }
}
