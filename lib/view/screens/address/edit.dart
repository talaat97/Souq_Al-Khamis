import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/editController.dart';
import '../../../core/function/valild.dart';
import '../../widgets/address/CustombuttonAddress.dart';
import '../../widgets/auth/text_field.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    EditAddressController pageController = Get.put(EditAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Address'),
      ),
      body: Column(
        children: [
          if (pageController.kGooglePlex != null)
            Expanded(
              child: Stack(
                children: [
                  GetBuilder<EditAddressController>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: pageController.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            pageController.googleMapController!
                                .complete(controller);
                          },
                          markers: pageController.marker.toSet(),
                          onTap: (LatLng argument) {
                            pageController.addMarkerOfMyplace(argument);
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustombuttonAddress(
                        text: 'Contuine',
                        onTap: () {
                          Get.bottomSheet(
                            backgroundColor: Colors.white,
                            Form(
                              key: pageController.addreessKey,
                              child: ListView(
                                padding: const EdgeInsets.all(15),
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'details',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  CustomTextField(
                                      hintText: 'enter name of addrees',
                                      labelText: 'Name',
                                      myController: pageController.name,
                                      myIcon: Icons.location_pin,
                                      valid: (val) {
                                        return checkVaild(
                                            val!, 5, 100, 'password');
                                      }),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    hintText: 'enter city ',
                                    labelText: 'City',
                                    myController: pageController.city,
                                    myIcon: Icons.location_city,
                                    valid: (val) {
                                      return checkVaild(
                                          val!, 5, 100, 'password');
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    hintText: 'enter street',
                                    labelText: 'Street',
                                    myController: pageController.street,
                                    myIcon: Icons.store_mall_directory_outlined,
                                    valid: (val) {
                                      return checkVaild(
                                          val!, 5, 100, 'password');
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustombuttonAddress(
                                    text: 'Add',
                                    onTap: () {
                                      pageController.editAddress();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            barrierColor:
                                Colors.black.withOpacity(0.5), // Optional
                            isDismissible: true,
                            enableDrag: false,
                          );
                        }),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
