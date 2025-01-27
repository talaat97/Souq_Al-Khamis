import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(String userId, String name, String city, String street, String lat,
      String lng) async {
    var response = await crud.postData(Applink.addAddress, {
      "userid": userId,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lng": lng,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(String userId) async {
    var response = await crud.postData(Applink.viewAddress,{
      "userid": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String addressId, String name, String city, String street,
      String lat, String lng) async {
    var response = await crud.postData(Applink.editAddress, {
      "addressId": addressId,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lng": lng,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressId) async {
    var response = await crud.postData(Applink.deleteAddress, {
      "addressId": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
