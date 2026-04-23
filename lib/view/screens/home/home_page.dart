import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomCardHome.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomTitleItmeams.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_items_scetion.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomAppbar.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_categories_scetion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_new_arrived_scetion.dart';
import '../../../controller/home/home_controller.dart';
import '../../widgets/home/home_scetions/list_offers_scetion.dart';
import '../../widgets/home/home_scetions/list_recommended_scetion.dart';
import '../../widgets/home/search_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.thirdColor,
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppbar(
                    myController: controller.searchContoller,
                    onChanged: (val) {
                      controller.isSerachEmpty(val);
                    },
                    title: '39'.tr,
                    onPreesedFavorite: () {
                      controller.goToFavoritePage();
                    },
                    onPreesedNotfication: () {
                      controller.goToNotifcationPage();
                    },
                    onPreesedSearch: () {
                      if ((controller.searchContoller?.text ?? '').isNotEmpty) {
                        controller.goSearch();
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: controller.isSearch
                      ? SearchList(searcList: controller.searchData)
                      : HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              CustomCardHome(title: '40'.tr, body: '41'.tr),
                              
                              const SizedBox(height: 10),
                              Customtitleitmeams(title: 'categories'.tr),
                              const Listcategories(),
                              
                              const SizedBox(height: 10),
                              Customtitleitmeams(title: 'items'.tr),
                              const Listiteams(),
                              
                              const SizedBox(height: 10),
                              Customtitleitmeams(title: 'offers'.tr),
                              const ListOffers(),

                              const SizedBox(height: 10),
                              Customtitleitmeams(title: 'New Arrivals'.tr),
                              const ListNewArrivals(),
                              
                              const SizedBox(height: 10),
                              Customtitleitmeams(title: 'Recommended'.tr),
                              const ListRecommended(),
                              
                              const SizedBox(height: 20), // Bottom padding
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
