import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  final void Function()? onPreesedFavorite;
  final void Function()? onPreesedNotfication;
  final void Function()? onPreesedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? myController;
  const CustomAppbar({
    super.key,
    required this.title,
    this.onPreesedFavorite,
    this.onPreesedNotfication,
    this.onPreesedSearch,
    this.onChanged,
    this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            controller: myController,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPreesedSearch, icon: const Icon(Icons.search)),
                hintText: title,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: AppColor.grey200),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 70,
          width: 60,
          decoration: BoxDecoration(
              color: AppColor.grey200, borderRadius: BorderRadius.circular(15)),
          child: IconButton(
              onPressed: onPreesedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: AppColor.grey600,
              )),
        ),
        const SizedBox(width: 10),
        Container(
          height: 70,
          width: 60,
          decoration: BoxDecoration(
              color: AppColor.grey200, borderRadius: BorderRadius.circular(15)),
          child: IconButton(
              onPressed: onPreesedNotfication,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: AppColor.grey600,
              )),
        ),
      ]),
    );
  }
}
