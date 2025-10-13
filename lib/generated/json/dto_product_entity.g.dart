import 'package:items_store/features/items/data/dto_product_entity.dart';
import 'package:items_store/generated/json/base/json_convert_content.dart';

DtoProductEntity $DtoProductEntityFromJson(Map<String, dynamic> json) {
  final DtoProductEntity dtoProductEntity = DtoProductEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dtoProductEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    dtoProductEntity.title = title;
  }
  final String? slug = jsonConvert.convert<String>(json['slug']);
  if (slug != null) {
    dtoProductEntity.slug = slug;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    dtoProductEntity.price = price;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    dtoProductEntity.description = description;
  }
  final DtoProductCategory? category =
      jsonConvert.convert<DtoProductCategory>(json['category']);
  if (category != null) {
    dtoProductEntity.category = category;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (images != null) {
    dtoProductEntity.images = images;
  }
  return dtoProductEntity;
}

Map<String, dynamic> $DtoProductEntityToJson(DtoProductEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['slug'] = entity.slug;
  data['price'] = entity.price;
  data['description'] = entity.description;
  data['category'] = entity.category.toJson();
  data['images'] = entity.images;
  return data;
}

extension DtoProductEntityExtension on DtoProductEntity {
  DtoProductEntity copyWith({
    int? id,
    String? title,
    String? slug,
    int? price,
    String? description,
    DtoProductCategory? category,
    List<String>? images,
  }) {
    return DtoProductEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..slug = slug ?? this.slug
      ..price = price ?? this.price
      ..description = description ?? this.description
      ..category = category ?? this.category
      ..images = images ?? this.images;
  }
}

DtoProductCategory $DtoProductCategoryFromJson(Map<String, dynamic> json) {
  final DtoProductCategory dtoProductCategory = DtoProductCategory();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dtoProductCategory.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    dtoProductCategory.name = name;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    dtoProductCategory.image = image;
  }
  final String? slug = jsonConvert.convert<String>(json['slug']);
  if (slug != null) {
    dtoProductCategory.slug = slug;
  }
  return dtoProductCategory;
}

Map<String, dynamic> $DtoProductCategoryToJson(DtoProductCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['image'] = entity.image;
  data['slug'] = entity.slug;
  return data;
}

extension DtoProductCategoryExtension on DtoProductCategory {
  DtoProductCategory copyWith({
    int? id,
    String? name,
    String? image,
    String? slug,
  }) {
    return DtoProductCategory()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image
      ..slug = slug ?? this.slug;
  }
}
