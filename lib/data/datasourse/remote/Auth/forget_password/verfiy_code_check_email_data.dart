import '../../../../../core/class/curd.dart';
import '../../../../../link_api.dart';

class VerfiyCodeCheckEmailData {
  Crud crud;
  VerfiyCodeCheckEmailData(this.crud);

   postData(String email, String verifyCode) async {
    var response = await crud.postData(Applink.verfiyCodeCheckEmailLink, {
      "email": email,
      "verifycode": verifyCode,
    });
     print('VerfiyCodeCheckEmailData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
