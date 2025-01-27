import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class FavoirteData {
  Crud crud;
  FavoirteData(this.crud);

  addFavorite(String userid, String iteamsid) async {
    var response = await crud.postData(Applink.addFavorite, {
      'userid': userid,
      'iteamsid': iteamsid,
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userid, String iteamsid) async {
    var response = await crud.postData(Applink.removeFavorite, {
      'userid': userid,
      'iteamsid': iteamsid,
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
  viewFavorite(String userid) async {
    var response = await crud.postData(Applink.viewFavorite, {
      'userid': userid,
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
