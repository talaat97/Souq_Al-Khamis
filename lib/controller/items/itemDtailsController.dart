import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:get/get.dart';

import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/cart/cart_data.dart';

abstract class ItemsDetailController extends GetxController {
  intialData();
}

class ItemsDetailControllerImp extends ItemsDetailController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late var iteamsModel;

  int countItemInCart = 0;
  late StatusRequest statusRequest;
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  getCount(String iteamsid) async {
    var response = await cartData.getCout(
      myServices.sharedPreferences.getString('id').toString(),
      iteamsid,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        countItemInCart = int.parse(response["data"]);
        return countItemInCart;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    iteamsModel = Get.arguments['itemModel'];
    await getCount(iteamsModel.iteamsId!);
    statusRequest = StatusRequest.sucess;
    update();
  }

  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}
