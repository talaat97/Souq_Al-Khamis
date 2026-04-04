import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderController.dart';
import '../../widgets/order/customNavigation_appBar.dart';
import '../../widgets/order/pendingThemeCard.dart';
import '../../widgets/order/archiveThemeCard.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomNavigationAppBar(),
      body: GetBuilder<OrderController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.namePage == 'pending'
              ? _buildOrderList(
                  context,
                  isEmpty: controller.ordersPending.isEmpty,
                  emptyIcon: Icons.pending_actions_outlined,
                  emptyMessage: 'no_pending_orders'.tr,
                  itemCount: controller.ordersPending.length,
                  itemBuilder: (index) => PendingThemeCard(
                    orderModel: controller.ordersPending[index],
                  ),
                )
              : _buildOrderList(
                  context,
                  isEmpty: controller.ordersArchive.isEmpty,
                  emptyIcon: Icons.archive_outlined,
                  emptyMessage: 'no_archive_orders'.tr,
                  itemCount: controller.ordersArchive.length,
                  itemBuilder: (index) => ArchiveThemeCard(
                    orderModel: controller.ordersArchive[index],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildOrderList(
    BuildContext context, {
    required bool isEmpty,
    required IconData emptyIcon,
    required String emptyMessage,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
  }) {
    if (isEmpty) {
      return _buildEmptyState(context, emptyIcon, emptyMessage);
    }

    return RefreshIndicator(
      onRefresh: () async => Get.find<OrderController>().refreshOrders(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: itemCount,
        itemBuilder: (context, index) => itemBuilder(index),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    IconData icon,
    String message,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'pull_to_refresh'.tr,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade400,
                ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => Get.find<OrderController>().refreshOrders(),
            icon: const Icon(Icons.refresh),
            label: Text('refresh'.tr),
          ),
        ],
      ),
    );
  }
}
