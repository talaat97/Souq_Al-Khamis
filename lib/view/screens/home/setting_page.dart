import 'package:souq_al_khamis/controller/settings/settings_contoller.dart';
import 'package:souq_al_khamis/core/constant/colors.dart';
import 'package:souq_al_khamis/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsContoller());
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Premium Header Section
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Positioned(
              top: Get.width * 0.2,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColor.white,
                      backgroundImage: AssetImage(AppImageAsset.onBoardingImageOne),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 70),
        
        // Settings Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "settings".tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingItem(
                      context,
                      title: "notifications".tr,
                      icon: Icons.notifications_active_outlined,
                      trailing: GetBuilder<SettingsContoller>(
                        builder: (controller) => Switch(
                          activeColor: AppColor.primaryColor,
                          value: controller.notifactionSwitch,
                          onChanged: (value) {
                            controller.notifactionSwitch = value;
                            controller.diableNotification();
                          },
                        ),
                      ),
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      context,
                      title: '51'.tr,
                      icon: Icons.location_on_outlined,
                      onTap: () => controller.goToAddressPage(),
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      context,
                      title: '52'.tr,
                      icon: Icons.info_outline,
                      onTap: () => controller.goToAddressPage(),
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      context,
                      title: '53'.tr,
                      icon: Icons.headset_mic_outlined,
                      onTap: () => controller.phoneCall(),
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      context,
                      title: '55'.tr,
                      icon: Icons.translate_rounded,
                      onTap: () => controller.showLanguageBottomSheet(),
                    ),
                    _buildDivider(),
                    _buildSettingItem(
                      context,
                      title: '54'.tr,
                      icon: Icons.logout_rounded,
                      iconColor: AppColor.redColor,
                      textColor: AppColor.redColor,
                      onTap: () => controller.logOut(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    Widget? trailing,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColor.primaryColor).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColor.primaryColor,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.black87,
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 70,
      endIndent: 20,
      color: Colors.grey.withOpacity(0.1),
    );
  }
}
