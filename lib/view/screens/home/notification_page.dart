import 'package:e_comerse_app/controller/home/notification_contoller.dart';
import 'package:e_comerse_app/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationContoller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('notifications',
            style: TextStyle(color: AppColor.primaryColor)),
        centerTitle: true,
      ),
      body: GetBuilder<NotificationContoller>(
        builder: (pageController) => HandlingDataView(
          statusRequest: pageController.statusRequest,
          widget: Column(
            children: [
              ...List.generate(
                pageController.notificationList.length,
                (index) => ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${pageController.notificationList[index]['notification_title']} Id :${pageController.notificationList[index]['notification_orderId']}'),
                      Text(
                        Jiffy.parse(
                                '${pageController.notificationList[index]['notification_dateTime']}')
                            .fromNow(),
                        style: const TextStyle(
                            fontSize: 15, color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  subtitle: Text(
                      '${pageController.notificationList[index]['notification_body']}'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
