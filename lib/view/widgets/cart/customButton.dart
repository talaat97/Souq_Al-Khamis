import 'package:e_comerse_app/controller/cart/cartContoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CuttomButtonOfCart extends StatelessWidget {
  final double order;
  final double coupon;
  final double shipping;
  final double totlaPrice;
  final void Function()? onPressed;
  final TextEditingController controllerCoupon;
  final void Function()? applyCoupon;
  const CuttomButtonOfCart({
    super.key,
    required this.order,
    required this.shipping,
    required this.totlaPrice,
    required this.onPressed,
    required this.controllerCoupon,
    this.applyCoupon,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => controller.hideBill
          ? IconButton(
              icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.thirdColor,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    color: AppColor.black,
                    size: 30,
                  )),
              onPressed: () {
                controller.hideBill = !controller.hideBill;
                controller.update();
              },
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.thirdColor,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.black,
                        size: 15,
                      )),
                  onPressed: () {
                    controller.hideBill = !controller.hideBill;
                    controller.update();
                  },
                ),
                controller.couponName == null
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: controllerCoupon,
                                  cursorColor: AppColor.primaryColor,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      isDense: true,
                                      hintText: 'Enter Coupon',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: AppColor.primaryColor))),
                                )),
                            const SizedBox(width: 5),
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: AppColor.primaryColor,
                                textColor: AppColor.white,
                                onPressed: applyCoupon,
                                child: const Text('Coupon'),
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        ' Code ${controller.couponName}',
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: AppColor.primaryColor, width: 1)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Order',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('$order',
                                style: Theme.of(context).textTheme.bodyLarge),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'discount',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('$coupon  %',
                                style: Theme.of(context).textTheme.bodyLarge),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'shipping',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('$shipping \$',
                                style: Theme.of(context).textTheme.bodyLarge),
                          )
                        ],
                      ),
                      const Divider(height: 3, color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Total price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 25,
                                      color: AppColor.secondColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('$totlaPrice  \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 25,
                                        color: AppColor.secondColor)),
                          )
                        ],
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColor.primaryColor,
                        textColor: AppColor.white,
                        onPressed: onPressed,
                        child: const Text('book order'),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
