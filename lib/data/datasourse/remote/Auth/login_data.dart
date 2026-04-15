import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password, String deviseToken) async {
    var response = await crud.postData(Applink.loginLink, {
      "email": email,
      "password": password,
      "deviceToken": deviseToken,
    });
    return response.fold((l) => l, (r) => r);
  }
}
