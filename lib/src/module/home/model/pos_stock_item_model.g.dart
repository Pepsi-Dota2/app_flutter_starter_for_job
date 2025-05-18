// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_stock_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosStockItemModelImpl _$$PosStockItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PosStockItemModelImpl(
      average_cost: json['average_cost'] as String? ?? "",
      balance_qty: json['balance_qty'] as String? ?? "",
      barcode: json['barcode'] as String? ?? "",
      group_main: json['group_main'] as String? ?? "",
      group_sub: json['group_sub'] as String? ?? "",
      ic_code: json['ic_code'] as String? ?? "",
      ic_name: json['ic_name'] as String? ?? "",
      ic_unit_code: json['ic_unit_code'] as String? ?? "",
      item_brand: json['item_brand'] as String? ?? "",
      item_cat_name: json['item_cat_name'] as String? ?? "",
      item_category: json['item_category'] as String? ?? "",
      main_name: json['main_name'] as String? ?? "",
      sale_price1: json['sale_price1'] as String? ?? "",
      sub_name: json['sub_name'] as String? ?? "",
      unit_code: json['unit_code'] as String? ?? "",
      url_image: json['url_image'] as String? ?? "",
    );

Map<String, dynamic> _$$PosStockItemModelImplToJson(
        _$PosStockItemModelImpl instance) =>
    <String, dynamic>{
      'average_cost': instance.average_cost,
      'balance_qty': instance.balance_qty,
      'barcode': instance.barcode,
      'group_main': instance.group_main,
      'group_sub': instance.group_sub,
      'ic_code': instance.ic_code,
      'ic_name': instance.ic_name,
      'ic_unit_code': instance.ic_unit_code,
      'item_brand': instance.item_brand,
      'item_cat_name': instance.item_cat_name,
      'item_category': instance.item_category,
      'main_name': instance.main_name,
      'sale_price1': instance.sale_price1,
      'sub_name': instance.sub_name,
      'unit_code': instance.unit_code,
      'url_image': instance.url_image,
    };
