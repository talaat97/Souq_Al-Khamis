import 'package:souq_al_khamis/controller/home/home_controller.dart';
import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/data/model/categoires_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';

class Listcategories extends GetView<HomeControllerImp> {
  const Listcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
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
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i, categoiresModel.categoriesName!);
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            height: 64,
            width: 64,
            child: SvgPicture.network(
              "${Applink.categoriesLink}/${categoiresModel.categoriesImage}",
              colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
              placeholderBuilder: (context) => const Center(
                child: SizedBox(
                  width: 20, 
                  height: 20, 
                  child: CircularProgressIndicator(strokeWidth: 2)
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tr(categoiresModel.categoriesName, categoiresModel.categoriesNameAr),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
