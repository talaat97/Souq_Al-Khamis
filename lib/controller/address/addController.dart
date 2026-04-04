import 'dart:async';

import 'package:souq_al_khamis/core/class/status_request.dart';
import 'package:souq_al_khamis/core/constant/routs_page.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:souq_al_khamis/data/datasourse/remote/address/address.dart';
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
        Get.snackbar('Well done !', 'Now you can order from this address');
      } else if (response['status'] == "failure") {
        print('=================================== location response failure');
      }
    }
  }

  addMarker(LatLng argument) {
    marker.clear();
    marker.add(Marker(
      markerId: const MarkerId('1'),
      position: argument,
    ));

    latLng = argument;
    update();
  }

  getCurrentPostion() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied.');
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    try {
      position = await Geolocator.getCurrentPosition();
      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 12,
      );
      addMarker(LatLng(position!.latitude, position!.longitude));
      statusRequest = StatusRequest.sucess;
    } catch (e) {
      print('Location Error: $e');
      statusRequest = StatusRequest.serverExaption;
    }
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
  void onClose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.onClose();
  }
}
