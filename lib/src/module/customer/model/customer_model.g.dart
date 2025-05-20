// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      address: json['address'] as String? ?? "N/A",
      adress1: json['adress1'] as String? ?? "N/A",
      area_code: json['area_code'] as String? ?? "",
      credit_status: (json['credit_status'] as num?)?.toInt() ?? 0,
      cust_code: json['cust_code'] as String? ?? "",
      cust_name: json['cust_name'] as String? ?? "",
      group_main_name: json['group_main_name'] as String? ?? "",
      group_sub_name: json['group_sub_name'] as String? ?? "",
      latlng: json['latlng'] as String? ?? "",
      logistic_area: json['logistic_area'] as String? ?? "",
      telephone: json['telephone'] as String? ?? "",
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'adress1': instance.adress1,
      'area_code': instance.area_code,
      'credit_status': instance.credit_status,
      'cust_code': instance.cust_code,
      'cust_name': instance.cust_name,
      'group_main_name': instance.group_main_name,
      'group_sub_name': instance.group_sub_name,
      'latlng': instance.latlng,
      'logistic_area': instance.logistic_area,
      'telephone': instance.telephone,
    };
