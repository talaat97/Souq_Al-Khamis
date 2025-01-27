import 'dart:async';
import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/data/datasourse/remote/orders/orderDetailsData.dart';
import 'package:e_comerse_app/data/model/orderDetailsModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/order_model.dart';

class Orderdetailscontroller extends GetxController {
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? cameraPosition;
  Marker? myMarker;
  List<Marker> marker = [];
  List<OrderDetailsModel> orderDetailsList = [];
  late OrderModel orderModel;
  Position? position;

  intialData() {
    if (orderModel.addressLat != null && orderModel.addressLang != null) {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel.addressLat!),
            double.parse(orderModel.addressLang!)),
        zoom: 12.4,
      );
      marker.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(double.parse(orderModel.addressLat!),
              double.parse(orderModel.addressLang!))));
    }
    getOrder();
  }

  getOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetailsData.getData(
      orderModel.orderId!.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responseList = response['data'];
        orderDetailsList.addAll(responseList.map(
          (e) => OrderDetailsModel.fromJson(e),
        ));
        // orderDetailsList = response['data']
        //     .map<OrderDetailsModel>((item) => OrderDetailsModel.fromJson(item))
        //     .toList();
        statusRequest = StatusRequest.sucess;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  itemPriceDiscount(price, discount) {
    return price - (price * (discount / 100));
  }

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    intialData();

    googleMapController = Completer<GoogleMapController>();
    super.onInit();
  }
}
