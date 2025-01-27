import 'package:e_comerse_app/core/services/services.dart';
import 'package:get/get.dart';

String tr(columnEn, columnAr) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return columnAr;
  } else {
    return columnEn;
  }
}
