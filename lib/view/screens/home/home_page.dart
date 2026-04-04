import 'package:cached_network_image/cached_network_image.dart';
import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomCardHome.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomTitleItmeams.dart';
import 'package:souq_al_khamis/view/widgets/home/ListIteams.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomAppbar.dart';
import 'package:souq_al_khamis/view/widgets/home/listCategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../data/model/iteams_model.dart';
import '../../../link_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.thirdColor,
      // ignore: deprecated_member_use
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppbar(
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
              controller.isSearch
                  ? SearchList(searcList: controller.searchData)
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          CustomCardHome(title: '40'.tr, body: '41'.tr),
                          Customtitleitmeams(title: '42'.tr),
                          const Listcategories(),
                          Customtitleitmeams(title: '43'.tr),
                          const Listiteams(),
                          Customtitleitmeams(title: '44'.tr),
                          const Listiteams(),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchList extends GetView<HomeControllerImp> {
  final List<IteamsModel> searcList;
  const SearchList({
    super.key,
    required this.searcList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searcList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToitemsDeails(searcList[index]);
          },
          child: Container(
            margin: const EdgeInsets.all(3),
            child: Card(
              color: AppColor.grey200,
              child: Row(
                children: [
                  Expanded(
                      child: Hero(
                    tag: searcList[index].iteamsId!,
                    child: CachedNetworkImage(
                        imageUrl:
                            '${Applink.iteamsLink}/${searcList[index].iteamsImage}'),
                  )),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${searcList[index].iteamsName} \n ${searcList[index].categoriesName}'),
                            SvgPicture.network(
                              height: 30,
                              width: 30,
                              "${Applink.categoriesLink}/${searcList[index].categoriesImage}",
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
