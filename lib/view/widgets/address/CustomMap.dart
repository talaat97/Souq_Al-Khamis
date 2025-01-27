import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/addController.dart';
import '../../../core/class/handling_data.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    AddressEditController pageController = Get.put(AddressEditController());
    return GetBuilder<AddressEditController>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: pageController.kGooglePlex!,
            onMapCreated: (GoogleMapController controller) {
              pageController.googleMapController!.complete(controller);
            },
            markers: pageController.marker.toSet(),
            onTap: (LatLng argument) {
              pageController.addMarkerOfMyplace(argument);
            },
          )),
    );
  }
}
