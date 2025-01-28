class OfferModel {
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
  String? ratingId;
  String? ratingIiteamid;
  String? ratingUserid;
  String? ratingRateiteam;
  String? ratingNoterateing;
  String? ratingAvr;
  String? iteamPriceDescount;

  OfferModel(
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
      this.ratingId,
      this.ratingIiteamid,
      this.ratingUserid,
      this.ratingRateiteam,
      this.ratingNoterateing,
      this.ratingAvr,
      this.iteamPriceDescount});

  OfferModel.fromJson(Map<String, dynamic> json) {
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
    ratingId = json['rating_id'];
    ratingIiteamid = json['rating_iiteamid'];
    ratingUserid = json['rating_userid'];
    ratingRateiteam = json['rating_rateiteam'];
    ratingNoterateing = json['rating_noterateing'];
    ratingAvr = json['ratingAvr'];
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
    data['rating_id'] = this.ratingId;
    data['rating_iiteamid'] = this.ratingIiteamid;
    data['rating_userid'] = this.ratingUserid;
    data['rating_rateiteam'] = this.ratingRateiteam;
    data['rating_noterateing'] = this.ratingNoterateing;
    data['ratingAvr'] = this.ratingAvr;
    data['iteamPriceDescount'] = this.iteamPriceDescount;
    return data;
  }
}
