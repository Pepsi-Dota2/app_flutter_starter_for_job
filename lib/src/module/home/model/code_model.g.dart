// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CodeModelImpl _$$CodeModelImplFromJson(Map<String, dynamic> json) =>
    _$CodeModelImpl(
      area_code: json['area_code'] as String? ?? "",
      bu_code: json['bu_code'] as String? ?? "",
      code: json['code'] as String? ?? "",
      cust_group_main: json['cust_group_main'] as String? ?? "",
      cust_group_sub: (json['cust_group_sub'] as num?)?.toInt() ?? 0,
      departmen: json['departmen'] as String? ?? "",
      ic_shelf: json['ic_shelf'] as String? ?? "",
      ic_wht: json['ic_wht'] as String? ?? "",
      logistic_code: json['logistic_code'] as String? ?? "",
      name_1: json['name_1'] as String? ?? "",
      side: json['side'] as String? ?? "",
      title: json['title'] as String? ?? "",
    );

Map<String, dynamic> _$$CodeModelImplToJson(_$CodeModelImpl instance) =>
    <String, dynamic>{
      'area_code': instance.area_code,
      'bu_code': instance.bu_code,
      'code': instance.code,
      'cust_group_main': instance.cust_group_main,
      'cust_group_sub': instance.cust_group_sub,
      'departmen': instance.departmen,
      'ic_shelf': instance.ic_shelf,
      'ic_wht': instance.ic_wht,
      'logistic_code': instance.logistic_code,
      'name_1': instance.name_1,
      'side': instance.side,
      'title': instance.title,
    };
