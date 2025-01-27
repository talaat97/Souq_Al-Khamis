import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/function/handling_data_controller.dart';
import 'package:e_comerse_app/data/model/order_model.dart';
import 'package:e_comerse_app/view/widgets/order/archiveThemeCard.dart';
import 'package:e_comerse_app/view/widgets/order/pendingThemeCard.dart';
import 'package:flutter/material.dart';
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
  printOrderType(String val) {
    return val == '0' ? 'Delivery' : 'Receive';
  }

  printOrrderPaymentMethod(String val) {
    return val == '0' ? 'cash' : 'payment cart';
  }

  printDeliverPriceOrder(String val) {
    return val == '0' ? 'no delivey price' : val;
  }

  printOrderStatus(String val) {
    if (val == '0') {
      return 'wait approve';
    }
    if (val == '1') {
      return 'On Way';
    } else {
      return 'archived';
    }
  }

  colorCard(String val) {
    if (val == '0') {
      return Colors.amber;
    }
    if (val == '1') {
      return Colors.green;
    } else {
      return const Color.fromARGB(255, 22, 78, 24);
    }
  }

  getPendingOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersPending.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getArchiveOrders() async {
    ordersPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getArchiveOrders(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        ordersArchive.addAll(responseData.map((e) => OrderModel.fromJson(e)));
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrders() {
    getPendingOrders();
    getArchiveOrders();
  }

  goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDeitails, arguments: {
      'orderModel': orderModel,
    });
  }

  deleteOrder(OrderModel orderModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.deleteOrder(
      orderModel.orderId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        ordersPending.remove(orderModel);
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  alertToDelete(OrderModel orderModel) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete order'),
        content:
            Text('are you suer deleting ${orderModel.orderId} this order?'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: AppColor.white,
                backgroundColor: AppColor.primaryColor),
            onPressed: () {
              deleteOrder(orderModel);
              Get.back();
            },
            child: const Text("Yes"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColor.black,
            ),
            child: const Text("cancel"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  pendingOrders() {
    return ListView.builder(
        itemCount: ordersPending.length,
        itemBuilder: (context, index) =>
            PendingThemeCard(orderModel: ordersPending[index]));
  }

  archiveOrders() {
    return ListView.builder(
        itemCount: ordersArchive.length,
        itemBuilder: (context, index) =>
            ArchiveThemeCard(orderModel: ordersArchive[index]));
  }

  changePage(name) {
    namePage = name;
    update();
  }

  ratingOrder(String orderId, rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ratingOrder(
      orderId,
      rating,
      comment,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.showSnackbar(const GetSnackBar(
          title: 'Thanks',
          message: 'you rating and message is supmitted 👍',
          duration: Duration(seconds: 3),
        ));
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    getPendingOrders();
    getArchiveOrders();
    super.onInit();
  }
}
