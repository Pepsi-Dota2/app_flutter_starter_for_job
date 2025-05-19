// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosStockModelImpl _$$PosStockModelImplFromJson(Map<String, dynamic> json) =>
    _$PosStockModelImpl(
      list: (json['list'] as List<dynamic>?)
              ?.map(
                  (e) => PosStockItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PosStockModelImplToJson(_$PosStockModelImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
