import 'package:e_comerse_app/controller/home/offers_controller.dart';
import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/view/widgets/offers/customThemeOffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColor.black,
        title: const Text(
          'Offers',
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          GetBuilder<OffersController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.offerIteams.length,
                  itemBuilder: (context, index) => CustomThemeOffer(
                      offerModel: controller.offerIteams[index]),
                )),
          )
        ],
      ),
    );
  }
}
