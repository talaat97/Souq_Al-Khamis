import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemDtailsController.dart';
import '../../../core/constant/colors.dart';

class SubitemsList extends GetView<ItemsDetailControllerImp> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColor.secondColor
                    : Colors.white,
                border: Border.all(color: AppColor.secondColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.secondColor,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
