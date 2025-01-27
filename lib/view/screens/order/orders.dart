import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderController.dart';
import '../../widgets/order/customNavigation_appBar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController pageController = Get.put(OrderController());
    return Scaffold(
      appBar: const CustomNavigationAppBar(),
      body: GetBuilder<OrderController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: pageController.namePage == 'pending'
              ? pageController.pendingOrders()
              : pageController.archiveOrders(),
        ),
      ),
    );
  }
}
