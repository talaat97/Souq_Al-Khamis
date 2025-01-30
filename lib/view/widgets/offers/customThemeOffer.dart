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
  final OfferModel offerModel;

  const CustomThemeOffer({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OffersController>();
    return InkWell(
      onTap: () {
        controller.goToIteamsDetails(offerModel);
      },
      child: Card(
        color: AppColor.grey200,
        elevation: 5,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Hero(
                    tag: '${offerModel.iteamsId}',
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Applink.iteamsLink}/${offerModel.iteamsImage}",
                      height: 150,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tr(offerModel.iteamsName, offerModel.iteamsNameAr),
                      style: const TextStyle(
                          fontSize: 25,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "category: ${offerModel.categoriesName!}|Offer: ${offerModel.iteamsDiscount}%",
                      style: const TextStyle(
                          fontSize: 20, color: AppColor.secondColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tr(offerModel.iteamsDec, offerModel.iteamsDecAr),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Rating:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                          ...List.generate(
                            5,
                            (index) =>
                                index < num.parse(offerModel.ratingAvr ?? '1')
                                    ? const Icon(
                                        Icons.star_border_outlined,
                                        color: AppColor.primaryColor,
                                        size: 27,
                                      )
                                    : const Icon(Icons.star_border,
                                        color: AppColor.black, size: 27),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${offerModel.iteamsPrice}' '\$',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColor.primaryColor),
                      ),
                      Text(
                        '${offerModel.iteamPriceDescount}' '\$',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: AppColor.primaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                AppImageAsset.saleImgae,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
