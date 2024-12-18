// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_luxury_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductModelImpl _$$GetProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProductModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      price: (json['price'] as num?)?.toInt() ?? 0,
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String? ?? "",
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GetProductModelImplToJson(
        _$GetProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'images': instance.images,
    };
