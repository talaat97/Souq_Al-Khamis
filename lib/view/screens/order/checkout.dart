import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/order/check_out.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/image_assets.dart';
import '../../widgets/checkout/CardPaymentMethodCheckout.dart';
import '../../widgets/checkout/CardShppingAddressCheckout.dart';
import '../../widgets/checkout/carddeliverytype.dart';
import '../../widgets/shared/app_button.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutContoller contoller = Get.put(CheckoutContoller());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text('checkout_title'.tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<CheckoutContoller>(
        builder: (controller) => HandlingDataView(
          statusRequest: contoller.statusRequest,
          widget: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildSectionTitle(context, "payment_method_choose".tr),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    controller.choosePaymentType("0");
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CardPaymentMethodCheckout(
                    title: 'cash_on_delivery'.tr,
                    isActive: contoller.paymentType == "0",
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.choosePaymentType("1");
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: CardPaymentMethodCheckout(
                    title: 'payment_card'.tr,
                    isActive: contoller.paymentType == "1",
                  ),
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, "delivery_type_choose".tr),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        contoller.chooseDeliverType("0"); // 0 => delivery
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage,
                          title: "delivery_standard".tr,
                          active: contoller.deliverType == "0"),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        contoller.chooseDeliverType("1"); // 1 => Receive
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage2,
                          title: "receive_standard".tr,
                          active: contoller.deliverType == "1"),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                if (contoller.deliverType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, "shipping_address".tr),
                      const SizedBox(height: 16),
                      if (contoller.addresses.isEmpty)
                        Container(
                            padding: const EdgeInsets.all(24),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.location_off_outlined,
                                    size: 60, color: Colors.grey.shade400),
                                const SizedBox(height: 16),
                                Text(
                                  "no_address_found".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.grey.shade600,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                TextButton.icon(
                                  onPressed: () {
                                    controller.goToAddress();
                                  },
                                  icon: const Icon(
                                      Icons.add_location_alt_rounded),
                                  label: Text("add_location".tr),
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ))
                      else
                        ...List.generate(
                          contoller.addresses.length,
                          (index) => InkWell(
                            onTap: () {
                              contoller.chooseShippigAddress(
                                  contoller.addresses[index].addressId!);
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: CardShppingAddressCheckout(
                                title:
                                    "${contoller.addresses[index].addressName}",
                                body:
                                    "${contoller.addresses[index].addressCity} | ${contoller.addresses[index].addressStreet}",
                                isactive: controller.addressId ==
                                    contoller.addresses[index].addressId!),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 100), // spacing for sticky bottom button
              ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ]),
        child: AppButton(
          text: "checkout_button".tr,
          onPressed: () {
            contoller.checkout();
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
