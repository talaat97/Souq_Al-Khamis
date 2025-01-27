import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustombuttonAddress extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? heightOfButoon;
  final double? widthOfButoon;

  const CustombuttonAddress({
    super.key,
    required this.text,
    this.onTap,
    this.heightOfButoon,
    this.widthOfButoon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: MaterialButton(
          height: heightOfButoon ?? 50,
          minWidth: widthOfButoon ?? 200,
          color: AppColor.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: onTap,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        ));
  }
}
