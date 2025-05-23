import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_stock_item_model.freezed.dart';
part 'pos_stock_item_model.g.dart';

@freezed
class PosStockItemModel with _$PosStockItemModel {
  const factory PosStockItemModel({
    @Default("") String average_cost,
    @Default(0) int balance_qty,
    @Default(0) int qty,
    @Default("") String name_1,
    @Default("") String code,
    @Default("") String unit_code,
    @Default("") String sale_price1,
    @Default("") String url_image,
  }) = _PosStockItemModel;

  factory PosStockItemModel.fromJson(Map<String, dynamic> json) =>
      _$PosStockItemModelFromJson(json);
}
