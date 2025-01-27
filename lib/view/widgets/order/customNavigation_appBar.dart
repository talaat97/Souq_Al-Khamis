import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderController.dart';
import '../../../core/constant/colors.dart';

class CustomNavigationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(OrderController());
    return GetBuilder<OrderController>(
      builder: (controller) => AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 5,
        title: Row(
          children: [
            Expanded(
              flex: pageController.namePage == 'pending' ? 2 : 1,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.production_quantity_limits_rounded,
                    color: Colors.white),
                label: const Text(
                  'Pending',
                  style: TextStyle(color: AppColor.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  pageController.changePage('pending');
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: pageController.namePage == 'achive' ? 2 : 1,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.archive_outlined, color: Colors.white),
                label: const Text(
                  'archive',
                  style: TextStyle(color: AppColor.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  pageController.changePage('achive');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
