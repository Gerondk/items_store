import 'dart:convert';

import 'package:items_store/generated/json/base/json_field.dart';
import 'package:items_store/generated/json/dto_product_entity.g.dart';

export 'package:items_store/generated/json/dto_product_entity.g.dart';

@JsonSerializable()
class DtoProductEntity {
  late int id;
  late String title;
  late String slug;
  late int price;
  late String description;
  late DtoProductCategory category;
  late List<String> images;

  DtoProductEntity();

  factory DtoProductEntity.fromJson(Map<String, dynamic> json) =>
      $DtoProductEntityFromJson(json);

  Map<String, dynamic> toJson() => $DtoProductEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DtoProductCategory {
  late int id;
  late String name;
  late String image;
  late String slug;

  DtoProductCategory();

  factory DtoProductCategory.fromJson(Map<String, dynamic> json) =>
      $DtoProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => $DtoProductCategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
