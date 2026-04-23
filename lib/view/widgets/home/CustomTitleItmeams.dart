import 'package:souq_al_khamis/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class Customtitleitmeams extends GetView<HomeControllerImp> {
  final String title;
  const Customtitleitmeams({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = controller.lang == 'ar';

    return Row(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      children: [
        // Bold accent bar — primaryColor (orange) for energy
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColor.primaryColor, AppColor.secondColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        // Title — secondColor (deep brown) pairs with the cream background
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.secondColor,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
