import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/notification/notification_ui_service.dart';
import 'package:souq_al_khamis/data/datasourse/remote/cart/cart_data.dart';
import 'package:souq_al_khamis/data/model/cart_Model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  List<CartModel> cartIteams = [];
  double orderPrice = 0;
  late double orderTotalPrice = 0;
  int numIteamsInCart = 0;
  TextEditingController? controllerCoupon;
  double couponDiscount = 0;
  double shipping = 0;
  String? couponName;
  String? couponId;
  StatusRequest statusRequest = StatusRequest.loading;
  bool hideBill = true;

  addToCart(String iteamsid) async {
    resetVar();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString('id').toString(),
      iteamsid,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        NotificationUIService.showBanner(
          title: 'Done',
          body: 'Item added to your cart',
        );
      } else {
        NotificationUIService.showBanner(
          title: 'Oops',
          body: 'Item is already out of cart',
        );
        statusRequest = StatusRequest.failure;
      }
      view();
    }
  }

  removeFromCart(String iteamsid) async {
    resetVar();
    statusRequest = StatusRequest.loading;

    var response = await cartData.removeCart(
      myServices.sharedPreferences.getString('id').toString(),
      iteamsid,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'failure') {
        NotificationUIService.showBanner(
          title: 'Oops',
          body: 'Item is already out of cart',
        );
      } else {
        NotificationUIService.showBanner(
          title: 'Done',
          body: 'Item removed from your cart',
        );
      }
      view();
    }
  }

  view() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['Cartdata'];
        orderPrice =
            double.parse(response['totalCartPriceAndCount']['totalCartPrice']);
        numIteamsInCart = int.parse(
            response['totalCartPriceAndCount']['totalCartIteamsCount']);
        cartIteams.addAll(responsedata.map((e) => CartModel.fromJson(e)));
        orderTotalPrice = totalPrice();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVar() {
    orderPrice = 0;
    numIteamsInCart = 0;
    cartIteams.clear();
  }

  couponData() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.couponData(
      controllerCoupon!.text,
    );
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        couponDiscount = double.parse(response['data']['coupon_discount']);
        couponName = response['data']['coupon_name'];
        couponId = response['data']['coupon_id'];
        totalPrice();
      } else {
        couponDiscount = 0;
        couponName = null;
        couponId = null;
        Get.snackbar(
          'Oops',
          'Coupon not valid',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToCheckout() {
    if (cartIteams.isNotEmpty) {
      Get.toNamed(AppRoute.checkout, arguments: {
        "orderPrice": orderPrice,
        "couponId": couponId ?? '0',
        "couponDiscount": couponDiscount,
        "shipping": shipping,
      });
    } else {
      Get.snackbar('تنبيه', 'السلة فارغة');
    }
  }

  double totalPrice() {
    return orderTotalPrice =
        (orderPrice - orderPrice * couponDiscount / 100) + shipping;
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    super.onInit();
    view();
  }
}
