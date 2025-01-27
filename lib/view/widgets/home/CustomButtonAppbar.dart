import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/bottomAppBar.dart';

class CustomButtonbar extends StatelessWidget {
  const CustomButtonbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: AppColor.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.titlePage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : OneButtonAppBar(
                        pageName: controller.titlePage[i]['title'],
                        pageIcon: controller.titlePage[i]['icon'],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentPage == i ? true : false,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OneButtonAppBar extends StatelessWidget {
  final String pageName;
  final IconData pageIcon;
  bool? active;
  final void Function() onPressed;
  OneButtonAppBar({
    super.key,
    required this.pageName,
    required this.pageIcon,
    required this.onPressed,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(pageIcon,
              size: active == true ? 35 : 25,
              color: active == true ? AppColor.primaryColor : AppColor.grey),
          Text(
            pageName,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey),
          ),
        ],
      ),
    );
  }
}
