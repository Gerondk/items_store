// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoProductEntity _$DtoProductEntityFromJson(Map<String, dynamic> json) =>
    DtoProductEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      category:
          DtoProductCategory.fromJson(json['category'] as Map<String, dynamic>),
      creationAt: json['creationAt'] as String,
      updatedAt: json['updatedAt'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DtoProductEntityToJson(DtoProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
      'images': instance.images,
    };

DtoProductCategory _$DtoProductCategoryFromJson(Map<String, dynamic> json) =>
    DtoProductCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$DtoProductCategoryToJson(DtoProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'slug': instance.slug,
    };
