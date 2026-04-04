import 'package:cached_network_image/cached_network_image.dart';
import 'package:souq_al_khamis/core/constant/image_assets.dart';
import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/data/model/offer_model.dart';
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
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                  ),
                  child: Center(
                    child: Hero(
                      tag: '${offerModel.iteamsId}',
                      child: CachedNetworkImage(
                        imageUrl: "${Applink.iteamsLink}/${offerModel.iteamsImage}",
                        height: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              tr(offerModel.iteamsName, offerModel.iteamsNameAr),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${offerModel.iteamsDiscount}% OFF'.tr,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Category: ${offerModel.categoriesName}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tr(offerModel.iteamsDec, offerModel.iteamsDecAr),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  index < num.parse(offerModel.ratingAvr ?? '1')
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  color: Colors.amber.shade400,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${offerModel.iteamsPrice}\$',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${offerModel.iteamPriceDescount}\$',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: 16,
              start: 16,
              child: Image.asset(
                AppImageAsset.saleImgae,
                height: 50,
                width: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
