import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/order/orderController.dart';
import '../../../core/class/handling_data.dart';
import '../../../core/constant/colors.dart';
import '../../../data/model/order_model.dart';

class PendingThemeCard extends StatelessWidget {
  final OrderModel orderModel;
  const PendingThemeCard({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(OrderController());
    return GetBuilder<OrderController>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Card(
            color: pageController.colorCard(orderModel.orderStatus!),
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID : ${orderModel.orderId}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        Jiffy.parse('${orderModel.orderDatetime}').fromNow(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    ' payment  : ${pageController.printOrrderPaymentMethod(orderModel.orderPaymentMethod!)}',
                    style: const TextStyle(fontSize: 20, color: AppColor.grey),
                  ),
                  Text(
                    ' Type  : ${pageController.printOrderType(orderModel.orderType!)}',
                    style: const TextStyle(fontSize: 20, color: AppColor.grey),
                  ),
                  Text(
                    ' Delivery : ${pageController.printDeliverPriceOrder(orderModel.orderPriceDelivery!)}',
                    style: const TextStyle(fontSize: 20, color: AppColor.grey),
                  ),
                  Text(
                    'Order Price  : ${orderModel.orderPrice}',
                    style: const TextStyle(fontSize: 20, color: AppColor.grey),
                  ),
                  Text(
                    'Order Status  : ${pageController.printOrderStatus(orderModel.orderStatus!)}',
                    style: const TextStyle(fontSize: 20, color: AppColor.grey),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price: ${orderModel.orderTotalPrice}\$',
                        style: const TextStyle(
                            fontSize: 23,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      if (orderModel.orderStatus == '0')
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            onTap: () {
                              controller.alertToDelete(orderModel);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                  fontSize: 18, color: AppColor.white),
                            ),
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            controller.goToOrderDetails(orderModel);
                          },
                          child: const Text(
                            'Details',
                            style:
                                TextStyle(fontSize: 18, color: AppColor.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
