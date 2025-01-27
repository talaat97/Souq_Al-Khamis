import '../../../../../core/class/curd.dart';
import '../../../../../link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String passwrod) async {
    var response = await crud.postData(Applink.reseetPasswordLink, {
      'email': email,
      'password': passwrod,
    });
    //print(' login data page ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
