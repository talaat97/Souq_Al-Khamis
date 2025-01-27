import 'dart:io';

import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> logOutAlert() {
  Get.defaultDialog(
    title: 'Alert',
    middleText: 'Are you sure log out?',
    actions: [
      ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text('Yes')),
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('No'))
    ],
  );
  return Future.value(true);
}

Future<bool> exitAlert() {
  Get.defaultDialog(
    title: 'Warnning',
    titleStyle: const TextStyle(color: AppColor.primaryColor, fontSize: 30),
    middleText: 'Are you sure to Exit the app',
    actions: [
      TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(AppColor.black),
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel')),
      TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(AppColor.white),
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColor.secondColor),
          ),
          onPressed: () {
            exit(0);
          },
          child: const Text('Exit')),
    ],
  );
  return Future.value(false);
}
