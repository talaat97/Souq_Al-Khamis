import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/editController.dart';
import '../../../core/function/valild.dart';
import '../../widgets/shared/app_button.dart';
import '../../widgets/auth/text_field.dart';

class AddressEdit extends StatelessWidget {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    EditAddressController pageController = Get.put(EditAddressController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Edit Address'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                  PositionedDirectional(
                    bottom: 24,
                    start: 24,
                    end: 24,
                    child: AppButton(
                        text: 'Continue'.tr,
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(24))
                              ),
                              child: Form(
                                key: pageController.addreessKey,
                                child: ListView(
                                  padding: const EdgeInsets.all(24),
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 40,
                                        height: 4,
                                        margin: const EdgeInsets.only(bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Address Details'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    CustomTextField(
                                        hintText: 'Enter name of address'.tr,
                                        labelText: 'Name'.tr,
                                        myController: pageController.name,
                                        myIcon: Icons.home_work_outlined,
                                        valid: (val) {
                                          return checkVaild(
                                              val!, 3, 100, '');
                                        }),
                                    const SizedBox(height: 16),
                                    CustomTextField(
                                      hintText: 'Enter city'.tr,
                                      labelText: 'City'.tr,
                                      myController: pageController.city,
                                      myIcon: Icons.location_city_outlined,
                                      valid: (val) {
                                        return checkVaild(
                                            val!, 3, 100, '');
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    CustomTextField(
                                      hintText: 'Enter street'.tr,
                                      labelText: 'Street'.tr,
                                      myController: pageController.street,
                                      myIcon: Icons.add_road_outlined,
                                      valid: (val) {
                                        return checkVaild(
                                            val!, 3, 100, '');
                                      },
                                    ),
                                    const SizedBox(height: 32),
                                    AppButton(
                                      text: 'Save Address'.tr,
                                      onPressed: () {
                                        pageController.editAddress();
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                            isDismissible: true,
                            enableDrag: true,
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
