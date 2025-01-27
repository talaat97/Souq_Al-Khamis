import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemDtailsController.dart';
import '../../../core/constant/colors.dart';

class PriceAndCountItems extends StatelessWidget {
  final int count;
  final String price;
  final String discountPrice;
  final void Function()? addCount;
  final void Function()? removeCount;
  const PriceAndCountItems(
      {super.key,
      required this.count,
      required this.price,
      required this.addCount,
      required this.removeCount,
      required this.discountPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addCount,
            ),
            Container(
              height: 45,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.secondColor)),
              child: GetBuilder<ItemsDetailControllerImp>(
                  builder: (controller) =>
                      controller.statusRequest == StatusRequest.sucess
                          ? Text(
                              '$count',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 2),
                              textAlign: TextAlign.center,
                            )
                          : const Center(child: CircularProgressIndicator())),
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: removeCount,
            ),
          ],
        ),
        discountPrice == price
            ? Text(
                '$price\$',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 40,
                      color: AppColor.secondColor,
                    ),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 70),
                    child: Text(
                      discountPrice,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 30,
                          color: AppColor.secondColor,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Text(
                    '$price\$',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 40, color: AppColor.secondColor),
                  ),
                ],
              )
      ],
    );
  }
}
