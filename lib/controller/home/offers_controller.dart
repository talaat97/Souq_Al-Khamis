import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/data/datasourse/remote/offer/offer_data.dart';
import 'package:e_comerse_app/data/model/offer_model.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';

class OffersController extends GetxController {
  List<OfferModel> offerIteams = [];
  OfferData favoirteData = OfferData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;

  viewOffers() async {
    offerIteams.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoirteData.viewOffers();
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        offerIteams = response['data']
            .map<OfferModel>((item) => OfferModel.fromJson(item))
            .toList();
        print(
            'offerIteams ====================================================');
        print(offerIteams);
        print(
            'offerIteams ====================================================');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToIteamsDetails(OfferModel iteamsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {
      'itemModel': iteamsModel,
    });
  }

  @override
  void onInit() {
    viewOffers();
    super.onInit();
  }
}
