import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String userid, String iteamsid) async {
    var response = await crud.postData(Applink.addCart, {
      'userid': userid,
      'iteamsid': iteamsid,
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String userid, String iteamsid) async {
    var response = await crud.postData(Applink.removeCart, {
      'userid': userid,
      'iteamsid': iteamsid,
    });
    // print(' ItemsData ============================= ${response}');
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userid) async {
    var response = await crud.postData(Applink.viewCart, {
      'userid': userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getCout(String userid, String iteamsid) async {
    var response = await crud.postData(Applink.getCount, {
      'userid': userid,
      'iteamsid': iteamsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  couponData(String coupon) async {
    var response = await crud.postData(Applink.checkCoupon, {
      'coupon': coupon,
    });

    return response.fold((l) => l, (r) => r);
  }
}
