import 'package:souq_al_khamis/controller/address/viewController.dart';
import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(ViewAddressController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Locations'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (pageController) => HandlingDataView(
          statusRequest: pageController.statusRequest,
          widget: const LocationThemeCart(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          pageController.goToAddAddress();
        },
        backgroundColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.add_location_alt_rounded, color: Colors.white),
        label: Text("Add Address".tr, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class LocationThemeCart extends StatelessWidget {
  const LocationThemeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(ViewAddressController());
    return GetBuilder<ViewAddressController>(
      builder: (controller) {
        if (pageController.addresses.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_off_outlined, size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text(
                  "No addresses found.\nAdd one to track your orders!".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          physics: const BouncingScrollPhysics(),
          itemCount: pageController.addresses.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pageController.addresses[index].addressName ?? '',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            pageController.addresses[index].addressCity ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            pageController.addresses[index].addressStreet ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade500,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  pageController.goToEditAddress(
                                      pageController.addresses[index]);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
                                ),
                                icon: const Icon(Icons.edit_location_alt_rounded, size: 18),
                                label: Text("Edit".tr),
                              ),
                              const SizedBox(width: 12),
                              TextButton.icon(
                                onPressed: () {
                                  _confirmDelete(context, pageController, index);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.redAccent,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Colors.redAccent.withOpacity(0.05),
                                ),
                                icon: const Icon(Icons.delete_outline_rounded, size: 18),
                                label: Text("Delete".tr),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, ViewAddressController pageController, int index) {
    Get.defaultDialog(
      title: "Delete Address".tr,
      titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      middleText: "Are you sure you want to delete this address?".tr,
      radius: 16,
      textCancel: "Cancel".tr,
      cancelTextColor: Colors.grey.shade700,
      textConfirm: "Delete".tr,
      confirmTextColor: Colors.white,
      buttonColor: Colors.redAccent,
      onConfirm: () {
        pageController.deleteAddress(pageController.addresses[index].addressId);
        Get.back();
      },
    );
  }
}
