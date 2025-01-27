import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerse_app/controller/favorite/favoriteController.dart';
import 'package:e_comerse_app/controller/items/itemsControlller.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/constant/image_assets.dart';
import 'package:e_comerse_app/core/function/translate_database.dart';
import 'package:e_comerse_app/data/model/iteams_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../link_api.dart';

class CustomThemeItems extends GetView<ItemsControllerTmp> {
  final IteamsModel iteamsModel;

  const CustomThemeItems({
    super.key,
    required this.iteamsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToitemsDeails(iteamsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: '${iteamsModel.iteamsId}',
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Applink.iteamsLink}/${iteamsModel.iteamsImage}",
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  tr(iteamsModel.iteamsName, iteamsModel.iteamsNameAr),
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  tr(iteamsModel.iteamsDec, iteamsModel.iteamsDecAr),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Rating'),
                    const SizedBox(
                      width: 10,
                    ),
                    ...List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star_border,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${iteamsModel.iteamPriceDescount}' '\$',
                      style: const TextStyle(color: AppColor.primaryColor),
                    ),
                    GetBuilder<FavoriteController>(
                      builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavirote[iteamsModel.iteamsId] ==
                              '1') {
                            controller.setFavorite(iteamsModel.iteamsId, '0');
                            controller.removeFavorite(iteamsModel.iteamsId!);
                          } else {
                            controller.setFavorite(iteamsModel.iteamsId, '1');
                            controller.addFavorite(iteamsModel.iteamsId!);
                          }
                        },
                        icon: Icon(
                          controller.isFavirote[iteamsModel.iteamsId] == '1'
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        color: AppColor.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
            if (iteamsModel.iteamsDiscount != "0")
              Positioned(
                top: 0,
                child: Image.asset(
                  AppImageAsset.saleImgae,
                  height: 55,
                  width: 55,
                ),
              )
          ],
        ),
      ),
    );
  }
}
