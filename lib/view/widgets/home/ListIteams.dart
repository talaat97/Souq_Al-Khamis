import 'package:cached_network_image/cached_network_image.dart';
import 'package:souq_al_khamis/data/model/topSailer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../link_api.dart';

class Listiteams extends GetView<HomeControllerImp> {
  const Listiteams({super.key});

  @override
  Widget build(BuildContext context) {
    // Make the grid responsive: compute childAspectRatio from available width so
    // items keep good proportions on different screen sizes.
    final int crossAxisCount = 2;
    const double spacing = 16;
    final double screenWidth = MediaQuery.of(context).size.width;
    // Parent `HomePage` adds horizontal padding of 15, so subtract it.
    final double horizontalPadding = 30; // 15 left + 15 right
    final double availableWidth =
        screenWidth - horizontalPadding - (spacing * (crossAxisCount - 1));
    final double itemWidth = availableWidth / crossAxisCount;
    // Reserve some space for the title/price area under the image. Adjust this
    // value if your text area is larger/smaller.
    const double textAreaHeight = 80;
    final double itemHeight = itemWidth + textAreaHeight;
    final double childAspectRatio = itemWidth / itemHeight;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: controller.iteams.length,
      itemBuilder: (context, index) => Iteams(
        topSailerModel: controller.iteams[index],
        topSalier: index + 1,
      ),
    );
  }
}

class Iteams extends GetView<HomeControllerImp> {
  final TopSailerModel topSailerModel;
  final int topSalier;

  const Iteams(
      {super.key, required this.topSailerModel, required this.topSalier});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToitemsDeails(topSailerModel);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    // 🐛 BUG FIX: implemented cached_network_image requirement
                    imageUrl:
                        "${Applink.iteamsLink}/${topSailerModel.iteamsImage}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade100,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topSailerModel.iteamsName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${topSailerModel.iteamsPrice} \$",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(16),
                  ),
                ),
                child: Text(
                  "Top $topSalier",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
