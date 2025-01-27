import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  view( String userid) async {
    var response = await crud.postData(Applink.viewNotification, {
      'userid': userid.toString(),
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
