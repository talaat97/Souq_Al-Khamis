import '../../core/function/parsing_helper.dart';

class IteamsModel {
  String? iteamsId;
  String? iteamsName;
  String? iteamsNameAr;
  String? iteamsDec;
  String? iteamsDecAr;
  String? iteamsImage;
  int? iteamsCount;
  String? iteamsActive;
  double? iteamsPrice;
  double? iteamsDiscount;
  String? iteamsDate;
  String? iteamsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  double? iteamPriceDescount;

  IteamsModel({
    this.iteamsId,
    this.iteamsName,
    this.iteamsNameAr,
    this.iteamsDec,
    this.iteamsDecAr,
    this.iteamsImage,
    this.iteamsCount,
    this.iteamsActive,
    this.iteamsPrice,
    this.iteamsDiscount,
    this.iteamsDate,
    this.iteamsCat,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
    this.iteamPriceDescount,
  });

  IteamsModel.fromJson(Map<String, dynamic> json) {
    iteamsId = json['iteams_id'].toString();
    iteamsName = json['iteams_name'];
    iteamsNameAr = json['iteams_name_ar'];
    iteamsDec = json['iteams_dec'];
    iteamsDecAr = json['iteams_dec_ar'];
    iteamsImage = json['iteams_image'];
    iteamsCount = parseInt(json['iteams_count']);
    iteamsActive = json['iteams_active'].toString();
    iteamsPrice = parseDouble(json['iteams_price']);
    iteamsDiscount = parseDouble(json['iteams_discount']);
    iteamsDate = json['iteams_date'];
    iteamsCat = json['iteams_cat'].toString();
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_date_time']; // Fixed key if needed, or kept consistent
    favorite = json['favorite'].toString();
    iteamPriceDescount = parseDouble(json['iteamPriceDescount']);
  }
}
