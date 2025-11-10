import 'package:json_annotation/json_annotation.dart';

part 'dto_product_entity.g.dart';

@JsonSerializable()
class DtoProductEntity {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final DtoProductCategory category;
  final String creationAt;
  final String updatedAt;
  final List<String> images;

  DtoProductEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.creationAt,
    required this.updatedAt,
    required this.images,
  });

  factory DtoProductEntity.fromJson(Map<String, dynamic> json) =>
      _$DtoProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DtoProductEntityToJson(this);
}

@JsonSerializable()
class DtoProductCategory {
  final int id;
  final String name;
  final String image;
  final String slug;

  DtoProductCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory DtoProductCategory.fromJson(Map<String, dynamic> json) =>
      _$DtoProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DtoProductCategoryToJson(this);
}
