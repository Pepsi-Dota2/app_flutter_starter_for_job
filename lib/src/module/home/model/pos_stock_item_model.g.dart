// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_stock_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosStockItemModelImpl _$$PosStockItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PosStockItemModelImpl(
      average_cost: json['average_cost'] as String? ?? "",
      balance_qty: (json['balance_qty'] as num?)?.toInt() ?? 0,
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      name_1: json['name_1'] as String? ?? "",
      code: json['code'] as String? ?? "",
      unit_code: json['unit_code'] as String? ?? "",
      sale_price1: json['sale_price1'] as String? ?? "",
      url_image: json['url_image'] as String? ?? "",
    );

Map<String, dynamic> _$$PosStockItemModelImplToJson(
        _$PosStockItemModelImpl instance) =>
    <String, dynamic>{
      'average_cost': instance.average_cost,
      'balance_qty': instance.balance_qty,
      'qty': instance.qty,
      'name_1': instance.name_1,
      'code': instance.code,
      'unit_code': instance.unit_code,
      'sale_price1': instance.sale_price1,
      'url_image': instance.url_image,
    };
