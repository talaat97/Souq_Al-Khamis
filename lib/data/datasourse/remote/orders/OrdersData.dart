import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  getPendingOrders(userid) async {
    var response = await crud.postData(Applink.pendingOrder, {
      'userId': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getArchiveOrders(userid) async {
    var response = await crud.postData(Applink.archiveOrder, {
      'userId': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(orderId) async {
    var response = await crud.postData(Applink.deleteOrder, {
      'orderId': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

  ratingOrder(orderId, rating, comment) async {
    var response = await crud.postData(Applink.ratingOrder, {
      'orderId': orderId,
      'rating': rating,
      'comment': comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
