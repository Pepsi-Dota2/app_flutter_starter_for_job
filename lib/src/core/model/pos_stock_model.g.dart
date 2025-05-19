// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosStockModelImpl _$$PosStockModelImplFromJson(Map<String, dynamic> json) =>
    _$PosStockModelImpl(
      wh_code: json['wh_code'] as String? ?? "",
      sh_code: json['sh_code'] as String? ?? "",
      cust_group_main: json['cust_group_main'] as String? ?? "",
      cust_group_sub: json['cust_group_sub'] as String? ?? "",
      currency_code: json['currency_code'] as String? ?? "",
      group_main: json['group_main'] as String? ?? "",
    );

Map<String, dynamic> _$$PosStockModelImplToJson(_$PosStockModelImpl instance) =>
    <String, dynamic>{
      'wh_code': instance.wh_code,
      'sh_code': instance.sh_code,
      'cust_group_main': instance.cust_group_main,
      'cust_group_sub': instance.cust_group_sub,
      'currency_code': instance.currency_code,
      'group_main': instance.group_main,
    };
