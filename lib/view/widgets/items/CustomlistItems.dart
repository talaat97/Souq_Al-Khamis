import 'package:cached_network_image/cached_network_image.dart';
import 'package:souq_al_khamis/controller/favorite/favoriteController.dart';
import 'package:souq_al_khamis/controller/items/itemsControlller.dart';
import 'package:souq_al_khamis/core/constant/image_assets.dart';
import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/data/model/iteams_model.dart';
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
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Hero(
                      tag: '${iteamsModel.iteamsId}',
                      child: CachedNetworkImage(
                        imageUrl: "${Applink.iteamsLink}/${iteamsModel.iteamsImage}",
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                      ),
                    ),
                  ),
                ),
                // Info
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(iteamsModel.iteamsName, iteamsModel.iteamsNameAr),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tr(iteamsModel.iteamsDec, iteamsModel.iteamsDecAr),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star_rounded, size: 16, color: Colors.amber.shade400),
                          const SizedBox(width: 4),
                          Text(
                            '4.5',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${iteamsModel.iteamPriceDescount} \$',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (favController) => InkWell(
                              onTap: () {
                                if (favController.isFavirote[iteamsModel.iteamsId] == '1') {
                                  favController.setFavorite(iteamsModel.iteamsId, '0');
                                  favController.removeFavorite(iteamsModel.iteamsId!);
                                } else {
                                  favController.setFavorite(iteamsModel.iteamsId, '1');
                                  favController.addFavorite(iteamsModel.iteamsId!);
                                }
                              },
                              child: Icon(
                                favController.isFavirote[iteamsModel.iteamsId] == '1'
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: favController.isFavirote[iteamsModel.iteamsId] == '1'
                                    ? Colors.red
                                    : Colors.grey.shade400,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (iteamsModel.iteamsDiscount != "0")
              PositionedDirectional(
                top: 0,
                start: 0,
                child: Image.asset(
                  AppImageAsset.saleImgae,
                  height: 45,
                  width: 45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
