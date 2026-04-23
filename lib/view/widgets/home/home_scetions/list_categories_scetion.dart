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
    if (controller.categories.isEmpty) {
      return const _EmptyCategoriesState();
    }

    return SizedBox(
      height: 110,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
        controller.goToItems(
            controller.categories, i, categoiresModel.categoriesName!);
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // Warm cream — consistent with page background
              color: const Color(0xffFFF8F3),
              border: Border.all(
                color: const Color(0xffDB6719).withValues(alpha: 0.15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.12),
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
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor, BlendMode.srcIn),
              placeholderBuilder: (context) => const Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tr(categoiresModel.categoriesName,
                categoiresModel.categoriesNameAr),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCategoriesState extends StatelessWidget {
  const _EmptyCategoriesState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 40,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 8),
            Text(
              "No categories available",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              "Please check back later",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}