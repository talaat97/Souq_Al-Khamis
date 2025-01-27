import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomDivider extends StatelessWidget {
  final String message;
  const CustomDivider({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: 40,
      decoration: BoxDecoration(
          color: AppColor.thirdColor,
          borderRadius: BorderRadius.circular(15)),
      child:  Center(
          child: Text(
        message,
        style:const TextStyle(color: Colors.white, fontSize: 17),
        textAlign: TextAlign.center,
      )),
    );
  }
}
