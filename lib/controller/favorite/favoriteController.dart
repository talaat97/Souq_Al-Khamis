import 'package:e_comerse_app/core/services/services.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/datasourse/remote/favorite/favoirteData.dart';

class FavoriteController extends GetxController {
  Map<String, String> isFavirote = {};
  List favoriteIteams = [];
  FavoirteData favoirteData = FavoirteData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;

  setFavorite(id, val) {
    isFavirote[id] = val;
    update();
  }

  getFavoriteData() async {
    favoriteIteams.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoirteData.viewFavorite(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        favoriteIteams.addAll(response['data']);
        print(favoriteIteams);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getFavoriteData();
    super.onInit();
  }

  addFavorite(String iteamsid) async {
    statusRequest = StatusRequest.loading;

    var response = await favoirteData.addFavorite(
      myServices.sharedPreferences.getString('id').toString(),
      iteamsid,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: 'Done', message: 'iteam add to favorite ');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String iteamsid) async {
    statusRequest = StatusRequest.loading;

    var response = await favoirteData.removeFavorite(
      myServices.sharedPreferences.getString('id').toString(),
      iteamsid,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: 'Done', message: 'iteam remove from favorite ');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    getFavoriteData();
  }

  // goToItemsDetails(FavoriteModel iteamsModel) {
  //   Get.toNamed(AppRoute.itemsDetails, arguments: {
  //     'itemModel': iteamsModel,
  //   });
  // }


}
