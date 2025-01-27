import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);

  viewOffers() async {
    var response = await crud.postData(Applink.viewOffers, {});

    return response.fold((l) => l, (r) => r);
  }
}
