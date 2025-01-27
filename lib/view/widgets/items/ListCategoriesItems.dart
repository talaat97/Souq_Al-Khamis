import 'package:e_comerse_app/data/model/categoires_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemsControlller.dart';
import '../../../core/constant/colors.dart';

class ListCategoriesItems extends GetView<ItemsControllerTmp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerTmp());
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 5),
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => Categories(
          i: index,
          categoiresModel: controller.categories[index],
        ),
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerTmp> {
  final CategoiresModel categoiresModel;
  final int i;
  const Categories({
    super.key,
    required this.categoiresModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i, categoiresModel.categoriesName!);
      },
      child: GetBuilder<ItemsControllerTmp>(
        builder: (controller) => controller.selectedCat == i
            ? Text(
                "${categoiresModel.categoriesName}",
                style: const TextStyle(
                  fontSize: 25,
                  color: AppColor.primaryColor,
                ),
              )
            : Text(
                "${categoiresModel.categoriesName}",
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                ),
              ),
      ),
    );
  }
}
