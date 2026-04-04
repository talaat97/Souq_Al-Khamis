import '../../core/function/parsing_helper.dart';

class TopSailerModel {
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
  String? topSailer;
  double? iteamPriceDescount;

  TopSailerModel(
      {this.iteamsId,
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
      this.topSailer,
      this.iteamPriceDescount});

  TopSailerModel.fromJson(Map<String, dynamic> json) {
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
    categoriesDatetime = json['categories_datetime'];
    topSailer = json['TopSailer'].toString();
    iteamPriceDescount = parseDouble(json['iteamPriceDescount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iteams_id'] = iteamsId;
    data['iteams_name'] = iteamsName;
    data['iteams_name_ar'] = iteamsNameAr;
    data['iteams_dec'] = iteamsDec;
    data['iteams_dec_ar'] = iteamsDecAr;
    data['iteams_image'] = iteamsImage;
    data['iteams_count'] = iteamsCount;
    data['iteams_active'] = iteamsActive;
    data['iteams_price'] = iteamsPrice;
    data['iteams_discount'] = iteamsDiscount;
    data['iteams_date'] = iteamsDate;
    data['iteams_cat'] = iteamsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['TopSailer'] = topSailer;
    data['iteamPriceDescount'] = iteamPriceDescount;
    return data;
  }
}
