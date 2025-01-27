import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBar extends StatelessWidget {
  final String title;
  const TopAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ))),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
