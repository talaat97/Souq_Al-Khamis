import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/function/translate_database.dart';
import 'package:e_comerse_app/view/widgets/itemsDetails/priceAndCount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cartContoller.dart';
import '../../../controller/items/itemDtailsController.dart';
import '../../widgets/itemsDetails/SubListItems.dart';
import '../../widgets/itemsDetails/itemPictureStack.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailControllerImp itemsDetailController =
        Get.put(ItemsDetailControllerImp());
    CartController cartContoller = Get.put(CartController());
    return Scaffold(
      body: ListView(
        children: [
          const TopProductPageDetails(),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(itemsDetailController.iteamsModel.iteamsName,
                      itemsDetailController.iteamsModel.iteamsNameAr),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 60),
                ),
                const SizedBox(height: 5),
                GetBuilder<ItemsDetailControllerImp>(
                  builder: (controller) => PriceAndCountItems(
                    discountPrice:
                        itemsDetailController.iteamsModel.iteamsPrice!,
                    count: itemsDetailController.countItemInCart,
                    price:
                        itemsDetailController.iteamsModel.iteamPriceDescount!,
                    addCount: () async {
                      itemsDetailController.countItemInCart++;
                    await cartContoller.addToCart(
                          itemsDetailController.iteamsModel.iteamsId!);
                      itemsDetailController.update();
                    },
                    removeCount: () async{
                      if (itemsDetailController.countItemInCart != 0) {
                        itemsDetailController.countItemInCart--;
                      await  cartContoller.removeFromCart(
                            itemsDetailController.iteamsModel.iteamsId!);
                        itemsDetailController.update();
                      } else {
                        Get.rawSnackbar(
                            title: 'OPPS!',
                            message: 'this item isaready zero',
                            duration: const Duration(seconds: 2));
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "${tr(itemsDetailController.iteamsModel.iteamsDec, itemsDetailController.iteamsModel.iteamsDecAr)}Anim veniam incididunt nisi nisi et esse mollit consectetur deserunt labore.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(
                  color: AppColor.primaryColor,
                  thickness: 2,
                  indent: 70,
                  endIndent: 70,
                ),
                Text(
                  '49'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                const SubitemsList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(20)),
        height: 50,
        child: TextButton(
          child: const Text(
            'Go to cart',
            style: TextStyle(color: AppColor.white),
          ),
          onPressed: () {
            itemsDetailController.goToCart();
          },
        ),
      ),
    );
  }
}
