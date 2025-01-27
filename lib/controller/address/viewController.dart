import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/core/services/services.dart';
import 'package:get/get.dart';

import '../../core/constant/routs_page.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/datasourse/remote/address/address.dart';
import '../../data/model/location_Model.dart';

class ViewAddressController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  List<AddressModel> addresses = [];
  AddressData addressData = AddressData(Get.find());

  viewAddresses() async {
    addresses.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString('id').toString(),
    );
    statusRequest = handlingData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        addresses.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToAddAddress() {
    Get.toNamed(AppRoute.addressAdd);
  }

  goToEditAddress(AddressModel addressModel) {
    Get.toNamed(AppRoute.addressEdit, arguments: {
      'addressModel': addressModel,
    });
  }

  deleteAddress(addressId) {
    addressData.deleteAddress(addressId);
    addresses.removeWhere((element) => element.addressId == addressId);
    update();
  }

  @override
  void onInit() {
    viewAddresses();
    super.onInit();
  }
}
