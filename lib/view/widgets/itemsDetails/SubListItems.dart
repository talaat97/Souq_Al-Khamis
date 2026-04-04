import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemDtailsController.dart';

class SubitemsList extends GetView<ItemsDetailControllerImp> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsetsDirectional.only(end: 12),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == "1"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).cardColor,
              border: Border.all(
                color: controller.subitems[index]['active'] == "1"
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: controller.subitems[index]['active'] == "1" ? [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ] : null,
            ),
            child: Text(
              controller.subitems[index]['name'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: controller.subitems[index]['active'] == "1"
                    ? Colors.white
                    : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
