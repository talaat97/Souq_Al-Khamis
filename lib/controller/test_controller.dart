import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/data/datasourse/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/function/handling_data_controller.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.loading;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await testData.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
