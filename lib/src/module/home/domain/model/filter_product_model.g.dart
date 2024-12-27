// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterProductModelImpl _$$FilterProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FilterProductModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
    );

Map<String, dynamic> _$$FilterProductModelImplToJson(
        _$FilterProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
