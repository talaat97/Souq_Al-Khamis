import 'package:cached_network_image/cached_network_image.dart';
import 'package:souq_al_khamis/controller/favorite/favoriteController.dart';
import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/data/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../link_api.dart';

class CustomThemefavrite extends StatelessWidget {
  final FavoriteModel iteamsModel;

  const CustomThemefavrite({
    super.key,
    required this.iteamsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey.shade50,
                  alignment: Alignment.center,
                  child: Hero(
                    tag: '${iteamsModel.iteamsId}',
                    child: CachedNetworkImage(
                      imageUrl: "${Applink.iteamsLink}/${iteamsModel.iteamsImage}",
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 8,
                  end: 8,
                  child: GetBuilder<FavoriteController>(
                    builder: (controller) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          controller.removeFavorite(iteamsModel.iteamsId!);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(iteamsModel.iteamsName, iteamsModel.iteamsNameAr),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber.shade400,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${iteamsModel.iteamsPrice}\$',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
