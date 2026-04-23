import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../data/model/iteams_model.dart';
import '../../../../link_api.dart';

class ListNewArrivals extends StatefulWidget {
  const ListNewArrivals({super.key});

  @override
  State<ListNewArrivals> createState() => _ListNewArrivalsState();
}

class _ListNewArrivalsState extends State<ListNewArrivals> {
  final controller = Get.find<HomeControllerImp>();

  final PageController _pageController = PageController(viewportFraction: 0.75);

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), autoSlide);
  }

  void autoSlide() {
    if (!mounted) return;

    final items = controller.newArrivals;
    if (items.isEmpty) return;

    currentPage++;

    if (currentPage >= items.length) {
      currentPage = 0;
    }

    _pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(seconds: 4), autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    final items = controller.newArrivals;

    if (items.isEmpty) {
      return const _EmptyNewArrivalsState();
    }

    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _NewArrivalCard(item: items[index]);
        },
      ),
    );
  }
}

class _NewArrivalCard extends GetView<HomeControllerImp> {
  final IteamsModel item;

  const _NewArrivalCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          controller.goToitemsDeails(item);
        },
        child: Stack(
          
          children: [
            /// Background Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: "${Applink.iteamsLink}/${item.iteamsImage}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
      
            /// Soft gradient overlay (for readability)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
      
            /// NEW badge (top right for variation)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "NEW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
      
            /// Bottom content (floating feel)
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // Warm cream — matches the page palette
                  color: const Color(0xffFFF8F3).withValues(alpha: 0.97),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xffDB6719).withValues(alpha: 0.10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.iteamsName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.iteamsPrice} \$",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
      
                        /// Small subtle icon (adds life)
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyNewArrivalsState extends StatelessWidget {
  const _EmptyNewArrivalsState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.fiber_new_outlined,
                size: 44,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "No new arrivals yet",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "We're preparing something fresh for you.\nStay tuned!",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
