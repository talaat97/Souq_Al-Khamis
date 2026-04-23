import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_items_scetion.dart';

import '../../../../controller/home/home_controller.dart';

class ListNewArrivals extends GetView<HomeControllerImp> {
  const ListNewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.newArrivals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final item = controller.newArrivals[index];

        return Iteams(
          iteamsModel: item,
          topSalier: index + 1,
        );
      },
    );
  }
}
