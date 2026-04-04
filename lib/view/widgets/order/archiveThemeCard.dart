import 'package:souq_al_khamis/core/function/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/order/orderController.dart';
import '../../../core/class/handling_data.dart';
import '../../../data/model/order_model.dart';

class ArchiveThemeCard extends StatelessWidget {
  final OrderModel orderModel;
  const ArchiveThemeCard({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    OrderController pageController = Get.put(OrderController());
    return GetBuilder<OrderController>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Card(
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${'Order ID'.tr} : #${orderModel.orderId}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          Jiffy.parse('${orderModel.orderDatetime}').fromNow(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1),
                  ),
                  _buildDetailRow(context, 'Payment'.tr, pageController.printOrderPaymentMethod(orderModel.orderPaymentMethod!)),
                  const SizedBox(height: 8),
                  _buildDetailRow(context, 'Delivery Type'.tr, pageController.printOrderType(orderModel.orderType!)),
                  const SizedBox(height: 8),
                  _buildDetailRow(context, 'Delivery Price'.tr, pageController.printDeliverPriceOrder(orderModel.orderPriceDelivery!)),
                  const SizedBox(height: 8),
                  _buildDetailRow(context, 'Order Status'.tr, pageController.printOrderStatus(orderModel.orderStatus!), isStatus: true),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(height: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price'.tr,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                          ),
                          Text(
                            '${orderModel.orderTotalPrice}\$',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (orderModel.orderRating == '0')
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: TextButton.icon(
                                onPressed: () {
                                  ratingDialog(context, orderModel.orderId!);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.amber.shade700,
                                  backgroundColor: Colors.amber.shade50,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                icon: const Icon(Icons.star_outline_rounded, size: 18),
                                label: Text('Rating'.tr),
                              ),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              controller.goToOrderDetails(orderModel);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            child: Text('Details'.tr),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isStatus ? Colors.green.shade600 : Colors.black87,
            fontWeight: isStatus ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
