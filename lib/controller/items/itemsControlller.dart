import 'package:e_comerse_app/controller/home/home_controller.dart';
import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/datasourse/remote/items/Items_data.dart';
import '../../data/model/iteams_model.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int i, String catName);
  getItemsByCategory(String catName);
  goToitemsDeails(IteamsModel iteamsModel);
}

class ItemsControllerTmp extends SearchMixController {
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();

  List items = [];
  String? catName;
  StatusRequest statusRequest = StatusRequest.loading;
  List categories = [];
  int? selectedCat;
  bool favActive = false;

  @override
  void onInit() {
    searchContoller = TextEditingController();
    super.onInit();
    initialData();
  }

  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catName = Get.arguments['catName'];
    getItemsByCategory(catName!);
  }

  changeCat(i, catName) {
    selectedCat = i;
    getItemsByCategory(catName);
    update();
  }

  getItemsByCategory(catName) async {
    items.clear();
    statusRequest = StatusRequest.loading;

    var response = await itemsData.getData(
      catName,
      myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToitemsDeails(iteamsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {
      'itemModel': iteamsModel,
    });
  }

  goToFavoritePage() {
    Get.toNamed(AppRoute.favoirtePage);
  }
}
