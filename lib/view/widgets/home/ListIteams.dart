import 'package:e_comerse_app/controller/home/home_controller.dart';
import 'package:e_comerse_app/data/model/topSailer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../link_api.dart';

class Listiteams extends GetView<HomeControllerImp> {
  const Listiteams({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 150,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemCount: controller.iteams.length,
          itemBuilder: (context, index) => Iteams(
              //index is to show it as 10 top sailes as Netflix
              topSailerModel: controller.iteams[index],
              topSalier: index + 1)),
    );
  }
}

class Iteams extends StatelessWidget {
  final TopSailerModel topSailerModel;
  final int topSalier;

  const Iteams(
      {super.key, required this.topSailerModel, required this.topSalier});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColor.grey200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              "${Applink.iteamsLink}/${topSailerModel.iteamsImage}",
              height: 140,
              width: 149,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(20))),
            child: Text(
              "Top $topSalier ",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
