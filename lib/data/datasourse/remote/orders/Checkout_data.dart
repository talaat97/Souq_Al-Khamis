

import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(Applink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
