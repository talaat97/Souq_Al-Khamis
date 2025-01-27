import 'dart:async';

import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:e_comerse_app/data/datasourse/remote/address/address.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? kGooglePlex;
  List<Marker> marker = [];
  Position? position;
  LatLng? latLng;
  AddressData addressData = AddressData(Get.find());
  GlobalKey<FormState> addreessKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();

  saveAddress() async {
    if (addreessKey.currentState!.validate()) {
      var response = await addressData.addAddress(
        myServices.sharedPreferences.getString('id').toString(),
        name.text,
        city.text,
        street.text,
        latLng!.latitude.toString(),
        latLng!.longitude.toString(),
      );
      if (response['status'] == "success") {
        goToAddressView();
        print('=================================== location saved correct');
      } else if (response['status'] == "failure") {
        print('=================================== location response failure');
      } else {
        print('=================================== location error');
      }
    }
  }

  addMarkerOfMyplace(argument) {
    marker.clear();
    marker.add(Marker(
      markerId: const MarkerId('1'),
      position: argument,
    ));
    latLng = argument;
    update();
  }

  getCurrentPostion() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 12,
    );
    statusRequest = StatusRequest.sucess;
    update();
  }

  goToAddressView() {
    Get.offAllNamed(AppRoute.home);
  }

  @override
  void onInit() {
    getCurrentPostion();
    googleMapController = Completer<GoogleMapController>();

    super.onInit();
  }

  @override
  dispose() {
    super.dispose();
    name.dispose();
    city.dispose();
    street.dispose();
  }
}
