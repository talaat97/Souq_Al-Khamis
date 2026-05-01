import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/core/services/notification/notification_ui_service.dart';
import 'package:souq_al_khamis/view/widgets/itemsDetails/priceAndCount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartContoller.dart';
import '../../../controller/items/itemDtailsController.dart';
import '../../widgets/itemsDetails/SubListItems.dart';
import '../../widgets/itemsDetails/itemPictureStack.dart';
import '../../widgets/shared/app_button.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailControllerImp itemsDetailController =
        Get.put(ItemsDetailControllerImp());
    CartController cartContoller = Get.put(CartController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          const TopProductPageDetails(),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(itemsDetailController.iteamsModel.iteamsName,
                      itemsDetailController.iteamsModel.iteamsNameAr),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GetBuilder<ItemsDetailControllerImp>(
                  builder: (controller) => PriceAndCountItems(
                    discountPrice:
                        itemsDetailController.iteamsModel.iteamsPrice!.toString(),
                    count: itemsDetailController.countItemInCart,
                    price:
                        itemsDetailController.iteamsModel.iteamPriceDescount!
                            .toString(),
                    addCount: () async {
                      itemsDetailController.countItemInCart++;
                      await cartContoller.addToCart(
                          itemsDetailController.iteamsModel.iteamsId!);
                      itemsDetailController.update();
                    },
                    removeCount: () async {
                      if (itemsDetailController.countItemInCart != 0) {
                        itemsDetailController.countItemInCart--;
                        await cartContoller.removeFromCart(
                            itemsDetailController.iteamsModel.iteamsId!);
                        itemsDetailController.update();
                      } else {
                        NotificationUIService.showBanner(
                            title: 'Oops!',
                            body: 'This item count is already zero');
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "${tr(itemsDetailController.iteamsModel.iteamsDec, itemsDetailController.iteamsModel.iteamsDecAr)} Anim veniam incididunt nisi nisi et esse mollit consectetur deserunt labore.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(height: 1),
                ),
                Text(
                  'Colors & Options'
                      .tr, // Generalizing "49" text which makes no sense structurally
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const SubitemsList(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
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
              )
            ]),
        child: AppButton(
          text: 'Go to cart'.tr,
          onPressed: () {
            itemsDetailController.goToCart();
          },
        ),
      ),
    );
  }
}
