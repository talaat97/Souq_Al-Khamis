import 'package:e_comerse_app/controller/home/home_controller.dart';
import 'package:e_comerse_app/core/function/translate_database.dart';
import 'package:e_comerse_app/data/model/categoires_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../link_api.dart';

class Listcategories extends GetView<HomeControllerImp> {
  const Listcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 100,
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

class Categories extends GetView<HomeControllerImp> {
  final CategoiresModel categoiresModel;
  final int i;
  const Categories({
    super.key,
    required this.categoiresModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp);
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i, categoiresModel.categoriesName!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondColor),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${Applink.categoriesLink}/${categoiresModel.categoriesImage}",
              color: AppColor.grey200,
            ),
          ),
          Text(
            tr(categoiresModel.categoriesName,
                categoiresModel.categoriesNameAr),
            style: const TextStyle(fontSize: 15, color: AppColor.grey),
          ),
        ],
      ),
    );
  }
}
