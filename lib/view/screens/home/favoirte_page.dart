import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favorite/favoriteController.dart';
import '../../../core/class/handling_data.dart';
import '../../../data/model/favorite_model.dart';
import '../../widgets/favorite/CustomThemeFavorit.dart';

class FavoirtePage extends StatelessWidget {
  const FavoirtePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          GetBuilder<FavoriteController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.favoriteIteams.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return CustomThemefavrite(
                      iteamsModel: FavoriteModel.fromJson(
                    controller.favoriteIteams[index],
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
