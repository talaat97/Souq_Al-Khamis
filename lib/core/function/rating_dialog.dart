import 'package:souq_al_khamis/controller/order/orderController.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/core/constant/image_assets.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

ratingDialog(BuildContext context, String orderId) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 2.0,
            title: Text(
              'rating_title'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            message: Text(
              'rating_message'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.logo,
              width: 150,
              height: 150,
            ),
            submitButtonText: 'submit'.tr,
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            commentHint: 'comment_hint'.tr,
            starColor: AppColor.primaryColor,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              print('rating: ${response.rating}, comment: ${response.comment}');
              OrderController pageController = Get.find();
              pageController.ratingOrder(
                  orderId, response.rating, response.comment);

              // TODO: add your own logic
              if (response.rating < 3.0) {
                // send their comments to your email or anywhere you wish
                // ask the user to contact you instead of leaving a bad review
              } else {}
            },
          ));
}
