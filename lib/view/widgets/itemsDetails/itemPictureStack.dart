import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerse_app/core/constant/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items/itemDtailsController.dart';
import '../../../core/constant/image_assets.dart';
import '../../../link_api.dart';

class TopProductPageDetails extends GetView<ItemsDetailControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        Positioned(
          top: 90,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: '${controller.iteamsModel.iteamsId}',
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                    fit: BoxFit.contain,
                    height: 250,
                    imageUrl: "${Applink.iteamsLink}"
                        '/'
                        "${controller.iteamsModel.iteamsImage}"),
                controller.iteamsModel.iteamsDiscount != "0"?
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    AppImageAsset.saleImgae,
                    height: 100,
                    width: 100,
                  ),
                ):Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
