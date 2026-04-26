import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_al_khamis/core/services/notification/notification_helper.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> intIt() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  var deviceToken = await NotificationsHelper.getFirebaseToken();
  print("---------------------------------------");
  print(deviceToken);
  print("---------------------------------------");
  NotificationsHelper.requestPermissionNotification();
  NotificationsHelper.configFCM();
  await Get.putAsync(() => MyServices().intIt());
}
