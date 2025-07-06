import 'package:souq_al_khamis/core/class/status_request.dart';
import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:souq_al_khamis/data/model/location_Model.dart';

import 'package:get/get.dart';

import '../../core/function/handling_data_controller.dart';
import '../../core/function/notification_helper.dart';
import '../../data/datasourse/remote/address/address.dart';
import '../../data/datasourse/remote/orders/Checkout_data.dart';

class CheckoutContoller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  String? paymentType;
  String? deliverType;
  String? addressId;
  late String orderPrice;
  late String couponId;
  late String couponDiscount;
  late String shipping;
  late var deviseToken;
  List<AddressModel> addresses = [];
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  choosePaymentType(String val) {
    paymentType = val;
    update();
  }

  chooseDeliverType(String val) {
    deliverType = val;
    update();
  }

  chooseShippigAddress(String val) {
    addressId = val;
    update();
  }

  getAddresses() async {
    addresses.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        addresses.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
        addressId = addresses[0].addressId.toString();
      }
    }
    update();
  }

  checkout() async {
    if (paymentType == null) {
      return Get.snackbar('sory', 'you have to add payment way');
    }
    if (deliverType == null) {
      return Get.snackbar('sory', 'you have to add delivery way');
    }
    if (deliverType == '0' && addressId == null) {
      return Get.snackbar(
          'sory', 'you have to Choose the location if you want delivery');
    }
    Map data = {
      'userId': myServices.sharedPreferences.getString('id').toString(),
      'addressId': addressId ?? '0',
      'odrderType': deliverType,
      'priceDelivery': shipping,
      'ordersPrice': orderPrice,
      'paymentMethod': paymentType,
      'couponId': couponId,
      'couponDiscount': couponDiscount,
      'userDeviceToken': deviseToken,
    };
    statusRequest = StatusRequest.loading;

    var response = await checkoutData.checkout(data);
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  goToAddress() {
    Get.toNamed(AppRoute.addressAdd);
  }

  @override
  void onInit() {
    orderPrice = Get.arguments['orderPrice'].toString();
    couponId = Get.arguments['couponId'].toString();
    couponDiscount = Get.arguments['couponDiscount'].toString();
    shipping = Get.arguments['shipping'].toString();
    deviseToken = NotificationsHelper.firebaseMessaging.getToken();
    getAddresses();
    super.onInit();
  }
}
