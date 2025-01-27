import 'package:e_comerse_app/data/datasourse/remote/notification/notification_data.dart';

import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';

class NotificationContoller extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();
  List notificationList = [];
  @override
  void onInit() {
    view();
    super.onInit();
  }

  view() async {
    notificationList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.view(
      myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        notificationList = response['data'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
