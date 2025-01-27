import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CuttomButtonOfLang extends StatelessWidget {
  final String nameLang;
  final void Function()? onPressed;
  const CuttomButtonOfLang(
      {super.key, required this.nameLang, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: MaterialButton(
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        onPressed: onPressed,
        child: Text(nameLang),
      ),
    );
  }
}
