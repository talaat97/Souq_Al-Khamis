import 'package:e_comerse_app/controller/favorite/favoriteController.dart';
import 'package:e_comerse_app/controller/items/itemsControlller.dart';
import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:e_comerse_app/data/model/iteams_model.dart';
import 'package:e_comerse_app/view/widgets/items/CustomlistItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/CustomAppbar.dart';
import '../../widgets/items/ListCategoriesItems.dart';
import '../home/home_page.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerTmp());
    FavoriteController favController = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ItemsControllerTmp>(
            builder: (controller) => ListView(
              children: [
                CustomAppbar(
                  myController: controller.searchContoller!,
                  onChanged: (val) {
                    controller.isSerachEmpty(val);
                  },
                  title: '39'.tr,
                  onPreesedFavorite: () {
                    controller.goToFavoritePage();
                  },
                  onPreesedSearch: () {
                    controller.goSearch();
                  },
                ),
                controller.isSearch
                    ? SearchList(searcList: controller.searchData)
                    : Column(
                        children: [
                          const ListCategoriesItems(),
                          HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.items.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.8),
                              itemBuilder: (context, index) {
                                favController.isFavirote[controller.items[index]
                                        ['iteams_id']] =
                                    controller.items[index]['favorite'];
                                return CustomThemeItems(
                                    iteamsModel: IteamsModel.fromJson(
                                  controller.items[index],
                                ));
                              },
                            ),
                          ),
                        ],
                      )
              ],
            ),
          )),
    );
  }
}
