// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillsModelImpl _$$BillsModelImplFromJson(Map<String, dynamic> json) =>
    _$BillsModelImpl(
      item_code: json['item_code'] as String? ?? '',
      item_name: json['item_name'] as String? ?? '',
      unit_code: json['unit_code'] as String? ?? '',
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      discount_amount: (json['discount_amount'] as num?)?.toInt() ?? 0,
      sum_amount: (json['sum_amount'] as num?)?.toInt() ?? 0,
      average_cost: (json['average_cost'] as num?)?.toInt() ?? 0,
      price_2: (json['price_2'] as num?)?.toInt() ?? 0,
      sum_amount_2: (json['sum_amount_2'] as num?)?.toInt() ?? 0,
      item_main_code: json['item_main_code'] as String? ?? '',
      product_type: json['product_type'] as String? ?? '',
    );

Map<String, dynamic> _$$BillsModelImplToJson(_$BillsModelImpl instance) =>
    <String, dynamic>{
      'item_code': instance.item_code,
      'item_name': instance.item_name,
      'unit_code': instance.unit_code,
      'qty': instance.qty,
      'price': instance.price,
      'discount': instance.discount,
      'discount_amount': instance.discount_amount,
      'sum_amount': instance.sum_amount,
      'average_cost': instance.average_cost,
      'price_2': instance.price_2,
      'sum_amount_2': instance.sum_amount_2,
      'item_main_code': instance.item_main_code,
      'product_type': instance.product_type,
    };
