import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class TrackLocationController extends GetxController {
  StreamSubscription<Position>? positionStream;

  getCurrentLocation() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      print(
          'latitude : ${position.latitude} , longitude : ${position.longitude}');
    });
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream?.cancel();
    super.onClose();
  }
}
