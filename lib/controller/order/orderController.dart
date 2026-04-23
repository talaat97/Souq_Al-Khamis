import 'package:flutter/material.dart';
import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis/data/model/order_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/orders/ordersData.dart';

class OrderController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  List<OrderModel> ordersPending = [];
  List<OrderModel> ordersArchive = [];
  String namePage = 'pending';

  // ─── Formatters ───────────────────────────────────────────
  String printOrderType(String val) =>
      val == '0' ? 'delivery_standard'.tr : 'receive_standard'.tr;

  String printOrderPaymentMethod(String val) =>
      val == '0' ? 'cash_on_delivery'.tr : 'payment_card'.tr;

  String printDeliverPriceOrder(String val) =>
      val == '0' ? 'no_delivery_price'.tr : val;

  String printOrderStatus(String val) {
    switch (val) {
      case '1':
        return 'status_wait_approve'.tr;
      case '2':
        return 'status_preparing'.tr;
      case '3':
        return 'status_on_way'.tr;
      case '4':
        return 'status_archived'.tr;
      default:
        return '';
    }
  }

  Color colorCard(String val) {
    switch (val) {
      case '1':
        return const Color.fromARGB(255, 255, 196, 3);
      case '2':
        return const Color.fromARGB(150, 255, 196, 3);
      case '3':
        return const Color.fromARGB(255, 76, 175, 80);
      default:
        return const Color.fromARGB(255, 158, 158, 158);
    }
  }

  // ─── API Calls ────────────────────────────────────────────
  Future<void> getPendingOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.getPendingOrders(
      myServices.sharedPreferences.getString('id').toString(),
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersPending.addAll(responseData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getArchiveOrders() async {
    ordersArchive.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.getArchiveOrders(
      myServices.sharedPreferences.getString('id').toString(),
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersArchive.addAll(responseData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> refreshOrders() async {
    await getPendingOrders();
    await getArchiveOrders();
  }

  Future<void> deleteOrder(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.deleteOrder(
      orderModel.orderId.toString(),
    );

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        ordersPending.remove(orderModel);
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> ratingOrder(String orderId, rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.ratingOrder(orderId, rating, comment);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.showSnackbar(
          GetSnackBar(
            title: 'thanks'.tr,
            message: 'rating_success'.tr,
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // ─── Navigation ───────────────────────────────────────────
  void goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  void changePage(String name) {
    namePage = name;
    update();
  }

  // ─── Dialogs (triggered from UI, but called here) ─────────
  void confirmDeleteOrder(OrderModel orderModel) {
    Get.defaultDialog(
      title: 'delete_order_title'.tr,
      middleText: '${'delete_order_confirm'.tr} #${orderModel.orderId}',
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          deleteOrder(orderModel);
        },
        child: Text('yes'.tr),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('cancel'.tr),
      ),
    );
  }

  // ─── Lifecycle ────────────────────────────────────────────
  @override
  void onInit() {
    getPendingOrders();
    getArchiveOrders();
    super.onInit();
  }
}
