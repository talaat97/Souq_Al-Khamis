import 'package:firebase_core/firebase_core.dart';
import 'package:souq_al_khamis/core/binding/initial_binding.dart';
import 'package:souq_al_khamis/core/localization/change_local.dart';
import 'package:souq_al_khamis/core/localization/translation.dart';
import 'package:souq_al_khamis/core/services/services.dart';
import 'package:souq_al_khamis/routs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Course',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
