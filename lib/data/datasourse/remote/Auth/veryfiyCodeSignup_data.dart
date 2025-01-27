import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class VerfiyCodeCheckEmailData {
  Crud crud;
  VerfiyCodeCheckEmailData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(Applink.verfiyCodeSignUp, {
      "email": email,
      "verifycode": verifyCode,
    });
    // print('============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
  sendData(String email) async {
    var response = await crud.postData(Applink.resendVerfiyCode, {
      "email": email,
    });
    // print('============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }

}
