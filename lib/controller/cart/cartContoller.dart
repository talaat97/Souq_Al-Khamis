import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/data/datasourse/remote/cart/cart_data.dart';
import 'package:e_comerse_app/data/model/cart_Model.dart';
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'Done',
            message: 'iteam add to your Cart',
            duration: const Duration(seconds: 2));
      } else {
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'failure') {
        Get.rawSnackbar(
            title: 'opps',
            message: 'it is arealy out of cart',
            duration: const Duration(seconds: 2));
      }
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'Done',
            message: 'iteam remove from your Cart ',
            duration: const Duration(seconds: 2));
      } else {
        statusRequest = StatusRequest.failure;
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['Cartdata'];
        cartIteams.addAll(responsedata.map((e) => CartModel.fromJson(e)));
        orderPrice = double.parse(response['priceAndCoun']['totalPrice']);
        numIteamsInCart = int.parse(response['priceAndCoun']['iteamsCount']);
        totalPrice();
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        couponDiscount = double.parse(response['data']['coupon_discount']);
        couponName = response['data']['coupon_name'];
        couponId = response['data']['coupon_id'];
        totalPrice();
      } else {
        couponDiscount = 0;
        couponName = null;
        couponId = null;
        Get.showSnackbar(const GetSnackBar(
          title: 'OPPS',
          message: 'coupon not valid',
          duration: Duration(seconds: 3),
        ));
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

  totalPrice() {
    orderTotalPrice =
        (orderPrice - orderPrice * couponDiscount / 100) + shipping;
    update();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    super.onInit();
    view();
  }
}
