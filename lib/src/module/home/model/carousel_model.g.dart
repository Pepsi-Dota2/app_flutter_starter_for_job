// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselModelImpl _$$CarouselModelImplFromJson(Map<String, dynamic> json) =>
    _$CarouselModelImpl(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$CarouselModelImplToJson(_$CarouselModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
