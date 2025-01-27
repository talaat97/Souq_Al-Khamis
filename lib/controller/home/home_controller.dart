import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:e_comerse_app/data/datasourse/remote/home/home_data.dart';
import 'package:e_comerse_app/data/model/categoires_model.dart';
import 'package:e_comerse_app/data/model/iteams_model.dart';
import 'package:e_comerse_app/core/function/notification_helper.dart';
import 'package:e_comerse_app/data/model/topSailer_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String catName);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  List<CategoiresModel> categories = [];
  List<TopSailerModel> iteams = [];

  String? username;
  String? id;
  String? lang;

  @override
  void onInit() {
    print(
        'user id :==================================================================');
    print(myServices.sharedPreferences.getString('id'));
    print(
        '===========================================================================');
    NotificationsHelper.firebaseMessaging.subscribeToTopic("users");
    initialData();
    getData();

    super.onInit();
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString('lang');
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseCategoriesData = response['categories'];
        categories.addAll(
            responseCategoriesData.map((e) => CategoiresModel.fromJson(e)));

        List responseIteamData = response['iteams'];
        iteams.addAll(responseIteamData.map((e) => TopSailerModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, catName) {
    Get.toNamed(AppRoute.items, arguments: {
      'categories': categories,
      'selectedCat': selectedCat,
      'catName': catName,
    });
  }

  goToFavoritePage() {
    Get.toNamed(AppRoute.favoirtePage);
  }

  goToNotifcationPage() {
    Get.toNamed(AppRoute.notficationPage);
  }

  goToitemsDeails(iteamsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {
      'itemModel': iteamsModel,
    });
  }
}

class SearchMixController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  HomeData homeData = HomeData(Get.find());

  List<IteamsModel> searchData = [];
  TextEditingController? searchContoller;
  bool isSearch = false;

  @override
  void onInit() {
    searchContoller = TextEditingController();
    super.onInit();
  }

  search() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.searchData(searchContoller!.text);
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        searchData.clear();
        List responseData = response['data'];
        searchData.addAll(responseData.map((e) => IteamsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  isSerachEmpty(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    /////////////////// if u want to make it auto search /////////////////////
    //  else {
    //   isSearch = true;
    //   search();
    // }
    update();
  }

  goSearch() {
    isSearch = true;
    search();
    update();
  }
}
