import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/notification/notification_helper.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:souq_al_khamis/data/datasourse/remote/home/home_data.dart';
import 'package:souq_al_khamis/data/model/categoires_model.dart';
import 'package:souq_al_khamis/data/model/home_model.dart';
import 'package:souq_al_khamis/data/model/iteams_model.dart';
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
  late HomeModel homeModel;
  List<CategoiresModel> categories = [];
  List<IteamsModel> newArrivals = [];
  List<IteamsModel> offers = [];
  List<IteamsModel> recommended = [];
  List<IteamsModel> iteams = [];
  String? username;
  String? id;
  String? lang;

  @override
  void onInit() {
    super.onInit();
    print(
        'user id :==================================================================');
    print(myServices.sharedPreferences.getString('id'));
    print(
        '===========================================================================');
    NotificationsHelper.firebaseMessaging.subscribeToTopic("users");
    initialData();
    getData();
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

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        homeModel = HomeModel.fromJson(response);

        categories = homeModel.categories;
        iteams = homeModel.iteams;
        newArrivals = homeModel.newArrivals;
        offers = homeModel.offers;
        recommended = homeModel.recommended;

        statusRequest = StatusRequest.success;
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

    if (StatusRequest.success == statusRequest) {
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
      update();
    }
    /////////////////// if u want to make it auto search /////////////////////
    else {
      goSearch();
    }
  }

  goSearch() {
    isSearch = true;
    search();
    update();
  }
}
