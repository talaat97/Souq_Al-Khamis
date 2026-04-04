import 'package:souq_al_khamis/controller/home/offers_controller.dart';
import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:souq_al_khamis/view/widgets/offers/customThemeOffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Offers'.tr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<OffersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.offerIteams.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => CustomThemeOffer(
                offerModel: controller.offerIteams[index]),
          ),
        ),
      ),
    );
  }
}
