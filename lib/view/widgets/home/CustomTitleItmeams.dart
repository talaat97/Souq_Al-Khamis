import 'package:e_comerse_app/controller/home/home_controller.dart';
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
    return Container(
      alignment: controller.lang =='ar'? Alignment.topRight:Alignment.topLeft,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColor.primaryColor),
      ),
    );
  }
}
