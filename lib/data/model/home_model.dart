import 'package:souq_al_khamis/data/model/categoires_model.dart';
import 'package:souq_al_khamis/data/model/iteams_model.dart';

class HomeModel {
  final List<CategoiresModel> categories;
  final List<IteamsModel> iteams;
  final List<IteamsModel> newArrivals;
  final List<IteamsModel> offers;
  final List<IteamsModel> recommended;

  HomeModel({
    required this.categories,
    required this.newArrivals,
    required this.offers,
    required this.recommended,
    required this.iteams,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      categories: (json['categories'] as List)
          .map((e) => CategoiresModel.fromJson(e))
          .toList(),
      iteams: (json['iteams'] as List)
          .map((e) => IteamsModel.fromJson(e))
          .toList(),
      newArrivals: (json['newArrivals'] as List)
          .map((e) => IteamsModel.fromJson(e))
          .toList(),
      offers:
          (json['offers'] as List).map((e) => IteamsModel.fromJson(e)).toList(),
      recommended: (json['recommended'] as List)
          .map((e) => IteamsModel.fromJson(e))
          .toList(),
    );
  }
}
