import 'package:e_comerse_app/controller/order/orderController.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/constant/image_assets.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

ratingDialog(BuildContext context, String orderId) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 2.0,
            title: const Text(
              'Gave us Rating',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.logo,
              width: 150,
              height: 150,
            ),
            submitButtonText: 'Submit',
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            commentHint: 'Set your custom comment hint',
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
