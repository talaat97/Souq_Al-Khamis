import 'package:cached_network_image/cached_network_image.dart';
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
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
        ),
        // A gentle circular spot behind the image
        PositionedDirectional(
          top: 60,
          start: Get.width / 2 - 100,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: Hero(
            tag: '${controller.iteamsModel.iteamsId}',
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  height: 250,
                  imageUrl: "${Applink.iteamsLink}/${controller.iteamsModel.iteamsImage}",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 60),
                ),
                if (controller.iteamsModel.iteamsDiscount != "0")
                  PositionedDirectional(
                    bottom: 0,
                    start: Get.width / 8,
                    child: Image.asset(
                      AppImageAsset.saleImgae,
                      height: 80,
                      width: 80,
                    ),
                  )
              ],
            ),
          ),
        ),
        // Add a modern back button overlay since the image stack removes the appbar natively
        PositionedDirectional(
          top: 48,
          start: 16,
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ]
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
