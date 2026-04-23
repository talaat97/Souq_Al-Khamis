import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomCardHome.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomTitleItmeams.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_items_scetion.dart';
import 'package:souq_al_khamis/view/widgets/home/CustomAppbar.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_categories_scetion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis/view/widgets/home/home_scetions/list_new_arrived_scetion.dart';
import '../../../controller/home/home_controller.dart';
import '../../widgets/home/home_scetions/list_offers_scetion.dart';
import '../../widgets/home/home_scetions/list_recommended_scetion.dart';
import '../../widgets/home/search_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ── Background gradient built from the brand palette ─────────────────────
  // Top: warm cream-white  →  Bottom: very light orange tint
  static const _bgGradient = LinearGradient(
    colors: [Color(0xffFFF8F3), Color(0xffFFF0E6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return Scaffold(
      // Use theme scaffold bg (F8F9FA) — NOT the washed-orange thirdColor
      backgroundColor: const Color(0xffFFF8F3),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => DecoratedBox(
          decoration: const BoxDecoration(gradient: _bgGradient),
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ── App Bar ────────────────────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomAppbar(
                      myController: controller.searchContoller,
                      onChanged: controller.isSerachEmpty,
                      title: '39'.tr,
                      onPreesedFavorite: controller.goToFavoritePage,
                      onPreesedNotfication: controller.goToNotifcationPage,
                      onPreesedSearch: () {
                        if ((controller.searchContoller?.text ?? '').isNotEmpty) {
                          controller.goSearch();
                        }
                      },
                    ),
                  ),
                ),

                // ── Body ──────────────────────────────────────────────────
                SliverToBoxAdapter(
                  child: controller.isSearch
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SearchList(searcList: controller.searchData),
                        )
                      : HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),

                                // ── Welcome Banner ───────────────────────
                                CustomCardHome(title: '40'.tr, body: '41'.tr),

                                const SizedBox(height: 22),

                                // ── Categories ───────────────────────────
                                Customtitleitmeams(title: 'categories'.tr),
                                const SizedBox(height: 8),
                                const _SectionCard(child: Listcategories()),

                                const SizedBox(height: 22),

                                // ── Items ─────────────────────────────────
                                Customtitleitmeams(title: 'items'.tr),
                                const SizedBox(height: 8),
                                const _SectionCard(child: Listiteams()),

                                const SizedBox(height: 22),

                                // ── Offers ────────────────────────────────
                                Customtitleitmeams(title: 'offers'.tr),
                                const SizedBox(height: 8),
                                const _SectionCard(child: ListOffers()),

                                const SizedBox(height: 22),

                                // ── New Arrivals ──────────────────────────
                                Customtitleitmeams(title: 'New Arrivals'.tr),
                                const SizedBox(height: 8),
                                const _SectionCard(child: ListNewArrivals()),

                                const SizedBox(height: 22),

                                // ── Recommended ───────────────────────────
                                Customtitleitmeams(title: 'Recommended'.tr),
                                const SizedBox(height: 8),
                                const _SectionCard(child: ListRecommended()),

                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
/// Clean white card that wraps each home section — theme-aware, no colour clash.
// ─────────────────────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // Pure white — matches theme cardColor and keeps inner widgets clean
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          // Subtle orange accent border — 1 px, barely visible
          color: AppColor.primaryColor.withValues(alpha: 0.14),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: child,
      ),
    );
  }
}
