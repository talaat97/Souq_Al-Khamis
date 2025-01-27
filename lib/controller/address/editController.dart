import 'dart:async';

import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/core/constant/routs_page.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:e_comerse_app/data/datasourse/remote/address/address.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/location_Model.dart';

class EditAddressController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? googleMapController;
  CameraPosition? kGooglePlex;
  List<Marker> marker = [];
  Position? position;
  LatLng? newLatLng;
  AddressData addressData = AddressData(Get.find());
  GlobalKey<FormState> addreessKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  AddressModel? myAddressModel;

  editAddress() async {
    if (addreessKey.currentState!.validate()) {
      var response = await addressData.editAddress(
        myAddressModel!.addressId!,
        name.text,
        city.text,
        street.text,
        newLatLng!.latitude.toString(),
        newLatLng!.longitude.toString(),
      );
      if (response['status'] == "success") {
        goToAddressView();
      }
    }
  }

  addMarkerOfMyplace(argument) {
    marker.clear();
    marker.add(Marker(
      markerId: const MarkerId('1'),
      position: argument,
    ));
    newLatLng = argument;
    update();
  }

  getLocation(LatLng locationOfThisAddress) async {
    kGooglePlex = CameraPosition(
      target: LatLng(
          locationOfThisAddress.latitude, locationOfThisAddress.longitude),
      zoom: 15,
    );
    addMarkerOfMyplace(locationOfThisAddress);
    statusRequest = StatusRequest.sucess;
    update();
  }

  goToAddressView() {
    Get.offAllNamed(AppRoute.addressView);
  }

  @override
  void onInit() {
    myAddressModel = Get.arguments['addressModel'];
    LatLng locationOfThisAddress = LatLng(
      double.parse(myAddressModel!.addressLat!),
      double.parse(myAddressModel!.addressLang!),
    );
    name.text = myAddressModel!.addressName!;
    city.text = myAddressModel!.addressCity!;
    street.text = myAddressModel!.addressStreet!;
    getLocation(locationOfThisAddress);
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
