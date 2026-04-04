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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('My Favorites'.tr, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.favoriteIteams.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return CustomThemefavrite(
                  iteamsModel: FavoriteModel.fromJson(
                controller.favoriteIteams[index],
              ));
            },
          ),
        ),
      ),
    );
  }
}
