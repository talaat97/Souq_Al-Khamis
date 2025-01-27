

import '../../../../../core/class/curd.dart';
import '../../../../../link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(Applink.checkEmailLink, {
      "email": email
    });
    //print(' login data page ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
