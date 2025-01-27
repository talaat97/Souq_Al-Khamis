class FavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteIteamsid;
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
  String? userId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteIteamsid,
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
      this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteIteamsid = json['favorite_iteamsid'];
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
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_iteamsid'] = this.favoriteIteamsid;
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
    data['user_id'] = this.userId;
    return data;
  }
}