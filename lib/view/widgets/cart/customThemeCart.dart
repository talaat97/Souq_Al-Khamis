import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../link_api.dart';

class CustomThemeCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String urlImage;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomThemeCart({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.urlImage,
   required this.onAdd,
   required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${Applink.iteamsLink}/$urlImage",
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title:
                      Text(name, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
                Text(count),
                
                IconButton(icon: const Icon(Icons.remove), onPressed: onRemove),
              ],
            ),
          )
        ],
      ),
    );
  }
}
