import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(Applink.loginLink, {
      "email": email,
      "password": password,
    });
     print(' login data page ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
