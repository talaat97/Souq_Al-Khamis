import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var response = await crud.postData(Applink.signupLink, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    // print('============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }
}
