import '../../core/function/parsing_helper.dart';

class CartModel {
  double? iteamsPrice;
  int? iteamsCount;
  String? cartId;
  String? cartUserid;
  String? cartItemsid;
  String? iteamsId;
  String? iteamsName;
  String? iteamsNameAr;
  String? iteamsDec;
  String? iteamsDecAr;
  String? iteamsImage;

  String? iteamsActive;

  double? iteamsDiscount;
  String? iteamsDate;
  String? iteamsCat;

  CartModel(
      {this.iteamsPrice,
      this.iteamsCount,
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.iteamsId,
      this.iteamsName,
      this.iteamsNameAr,
      this.iteamsDec,
      this.iteamsDecAr,
      this.iteamsImage,
      this.iteamsActive,
      this.iteamsDiscount,
      this.iteamsDate,
      this.iteamsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    iteamsPrice = parseDouble(json['iteamsPrice']);
    iteamsCount = parseInt(json['countItems']);
    cartId = json['cart_id'].toString();
    cartUserid = json['cart_userid'].toString();
    cartItemsid = json['cart_itemsid'].toString();
    iteamsId = json['iteams_id'].toString();
    iteamsName = json['iteams_name'];
    iteamsNameAr = json['iteams_name_ar'];
    iteamsDec = json['iteams_dec'];
    iteamsDecAr = json['iteams_dec_ar'];
    iteamsImage = json['iteams_image'];
    iteamsActive = json['iteams_active'].toString();
    iteamsDiscount = parseDouble(json['iteams_discount']);
    iteamsDate = json['iteams_date'];
    iteamsCat = json['iteams_cat'].toString();
  }
}
