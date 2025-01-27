import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/constant/image_assets.dart';
import 'package:e_comerse_app/core/function/translate_database.dart';
import 'package:e_comerse_app/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/offers_controller.dart';
import '../../../link_api.dart';

class CustomThemeOffer extends StatelessWidget {
  final OfferModel iteamsModel;

  const CustomThemeOffer({
    super.key,
    required this.iteamsModel,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OffersController>();
    return InkWell(
      onTap: () {
        controller.goToIteamsDetails(iteamsModel);
      },
      child: Card(
        color: AppColor.grey200,
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
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  tr(iteamsModel.iteamsName, iteamsModel.iteamsNameAr),
                  style: const TextStyle(
                      fontSize: 25,
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
                      style: const TextStyle(
                          fontSize: 25, color: AppColor.primaryColor),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                AppImageAsset.saleImgae,
                height: 70,
                width: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
