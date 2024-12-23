// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductionModelImpl _$$GetProductionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProductionModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GetProductionModelImplToJson(
        _$GetProductionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
    };
