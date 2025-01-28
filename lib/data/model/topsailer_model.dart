class TopSailerModel {
  String? iteamsId;
  String? iteamsName;
  String? iteamsNameAr;
  String? iteamsDec;
  String? iteamsDecAr;
  String? iteamsImage;
  String? iteamsCount;
  String? iteamsActive;
  String? iteamsPrice;
  String? iteamsDiscount;
  String? iteamsDate;
  String? iteamsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? topSailer;
  String? iteamPriceDescount;

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
    iteamsId = json['iteams_id'];
    iteamsName = json['iteams_name'];
    iteamsNameAr = json['iteams_name_ar'];
    iteamsDec = json['iteams_dec'];
    iteamsDecAr = json['iteams_dec_ar'];
    iteamsImage = json['iteams_image'];
    iteamsCount = json['iteams_count'];
    iteamsActive = json['iteams_active'];
    iteamsPrice = json['iteams_price'];
    iteamsDiscount = json['iteams_discount'];
    iteamsDate = json['iteams_date'];
    iteamsCat = json['iteams_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    topSailer = json['TopSailer'];
    iteamPriceDescount = json['iteamPriceDescount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iteams_id'] = this.iteamsId;
    data['iteams_name'] = this.iteamsName;
    data['iteams_name_ar'] = this.iteamsNameAr;
    data['iteams_dec'] = this.iteamsDec;
    data['iteams_dec_ar'] = this.iteamsDecAr;
    data['iteams_image'] = this.iteamsImage;
    data['iteams_count'] = this.iteamsCount;
    data['iteams_active'] = this.iteamsActive;
    data['iteams_price'] = this.iteamsPrice;
    data['iteams_discount'] = this.iteamsDiscount;
    data['iteams_date'] = this.iteamsDate;
    data['iteams_cat'] = this.iteamsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['TopSailer'] = this.topSailer;
    data['iteamPriceDescount'] = this.iteamPriceDescount;
    return data;
  }
}
