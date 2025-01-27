import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/Checkout.dart';
import '../../../core/constant/image_assets.dart';
import '../../widgets/checkout/CardPaymentMethodCheckout.dart';
import '../../widgets/checkout/CardShppingAddressCheckout.dart';
import '../../widgets/checkout/carddeliverytype.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutContoller contoller = Get.put(CheckoutContoller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      ),
      body: GetBuilder<CheckoutContoller>(
        builder: (controller) => HandlingDataView(
          statusRequest: contoller.statusRequest,
          widget: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Text(
                  "Choose Payment Method",
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentType("0");
                  },
                  child: CardPaymentMethodCheckout(
                    title: 'Cash mony',
                    isActive: contoller.paymentType == "0" ? true : false,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentType("1");
                  },
                  child: CardPaymentMethodCheckout(
                    title: 'Payment Card',
                    isActive: contoller.paymentType == "1" ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Choose Type Delivery",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondColor)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        contoller.chooseDeliverType("0"); // 0 => delivery
                      },
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage,
                          title: "Delivery",
                          active: contoller.deliverType == "0" ? true : false),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        contoller.chooseDeliverType("1"); // 1 => Receive
                      },
                      child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage2,
                          title: "Receive",
                          active: contoller.deliverType == "1" ? true : false),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (contoller.deliverType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Shipping Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor)),
                      const SizedBox(height: 10),
                      ...List.generate(
                        contoller.addresses.length,
                        (index) => InkWell(
                          onTap: () {
                            contoller.chooseShippigAddress(
                                contoller.addresses[index].addressId!);
                          },
                          child: CardShppingAddressCheckout(
                              title:
                                  "${contoller.addresses[index].addressName}",
                              body:
                                  "${contoller.addresses[index].addressCity} | ${contoller.addresses[index].addressStreet}",
                              isactive: controller.address ==
                                  contoller.addresses[index].addressId!),
                        ),
                      ),
                    ],
                  ),
              ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secondColor,
          textColor: Colors.white,
          onPressed: () {
            contoller.checkout();
          },
          child: const Text("CheckOut",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
      ),
    );
  }
}
