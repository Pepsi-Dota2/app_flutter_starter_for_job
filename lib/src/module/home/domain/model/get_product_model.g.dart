// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProductModelImpl _$$GetProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProductModelImpl(
      albumId: (json['albumId'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      url: json['url'] as String? ?? "",
      thumbnailUrl: json['thumbnailUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$GetProductModelImplToJson(
        _$GetProductModelImpl instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
