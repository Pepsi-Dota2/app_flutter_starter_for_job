// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosStockModelImpl _$$PosStockModelImplFromJson(Map<String, dynamic> json) =>
    _$PosStockModelImpl(
      has_more: json['has_more'] as bool? ?? false,
      limit: json['limit'] ?? 0,
      list: (json['list'] as List<dynamic>?)
              ?.map(
                  (e) => PosStockItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 0,
      total_rows: (json['total_rows'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PosStockModelImplToJson(_$PosStockModelImpl instance) =>
    <String, dynamic>{
      'has_more': instance.has_more,
      'limit': instance.limit,
      'list': instance.list,
      'page': instance.page,
      'total_rows': instance.total_rows,
    };
