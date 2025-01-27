import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String catName, String userid) async {
    var response = await crud.postData(Applink.itmesLink, {
      'catName': catName,
      'userid': userid.toString(),
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
