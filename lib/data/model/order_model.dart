class OrderModel {
  String? orderId;
  String? orderUserid;
  String? orderCoupon;
  String? orderAddress;
  String? orderType;
  String? orderPriceDelivery;
  String? orderDatetime;
  String? orderPrice;
  String? orderTotalPrice;
  String? orderPaymentMethod;
  String? orderStatus;
  String? orderRating;
  String? orderRatingComment;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  OrderModel(
      {this.orderId,
      this.orderUserid,
      this.orderCoupon,
      this.orderAddress,
      this.orderType,
      this.orderPriceDelivery,
      this.orderDatetime,
      this.orderPrice,
      this.orderTotalPrice,
      this.orderPaymentMethod,
      this.orderStatus,
      this.orderRating,
      this.orderRatingComment,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderCoupon = json['order_coupon'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPriceDelivery = json['order_price_delivery'];
    orderDatetime = json['order_datetime'];
    orderPrice = json['order_price'];
    orderTotalPrice = json['order_total_price'];
    orderPaymentMethod = json['order_payment_method'];
    orderStatus = json['order_status'];
    orderRating = json['order_rating'];
    orderRatingComment = json['order_rating_comment'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_coupon'] = this.orderCoupon;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_price_delivery'] = this.orderPriceDelivery;
    data['order_datetime'] = this.orderDatetime;
    data['order_price'] = this.orderPrice;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_status'] = this.orderStatus;
    data['order_rating'] = this.orderRating;
    data['order_rating_comment'] = this.orderRatingComment;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    return data;
  }
}
