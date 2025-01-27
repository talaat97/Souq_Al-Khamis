import 'package:e_comerse_app/controller/settings/settings_contoller.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

bool val = true;

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsContoller());

    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColor.primaryColor,
            ),
            Positioned(
                top: Get.width / 4.8,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColor.primaryColor,
                    backgroundImage: AssetImage(AppImageAsset.logo),
                  ),
                ))
          ],
        ),
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('50'.tr),
                  onTap: () {},
                  trailing: GetBuilder<SettingsContoller>(
                    builder: (controller) => Switch(
                      activeColor: AppColor.primaryColor,
                      value: val,
                      onChanged: (value) {
                        val = value;
                        controller.update();
                      },
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text('51'.tr),
                  onTap: () {
                    controller.goToAddressPage();
                  },
                  trailing: const Icon(Icons.location_pin),
                ),
                const Divider(),
                ListTile(
                  title: Text('52'.tr),
                  onTap: () {},
                  trailing: const Icon(Icons.adb_outlined),
                ),
                const Divider(),
                ListTile(
                  title: Text('53'.tr),
                  onTap: () {
                    launchUrl(Uri.parse('tel:+201113809492'));
                  },
                  trailing: const Icon(Icons.phone),
                ),
                const Divider(),
                ListTile(
                  title: Text('55'.tr),
                  onTap: () {
                    controller.changeLang();
                  },
                  trailing: const Icon(Icons.language),
                ),
                const Divider(),
                ListTile(
                  title: Text('54'.tr),
                  onTap: () {
                    controller.logOut();
                  },
                  trailing: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
