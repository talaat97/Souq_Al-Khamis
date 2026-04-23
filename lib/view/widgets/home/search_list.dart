import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:souq_al_khamis/controller/home/home_controller.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/data/model/iteams_model.dart';
import 'package:souq_al_khamis/link_api.dart';

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
