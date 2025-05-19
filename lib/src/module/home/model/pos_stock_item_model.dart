import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_stock_item_model.freezed.dart';
part 'pos_stock_item_model.g.dart';

@freezed
class PosStockItemModel with _$PosStockItemModel {
  const factory PosStockItemModel({
    @Default("") String average_cost,
    @Default(0) int balance_qty,
    @Default("") String name_1,
    @Default("") String group_main,
    @Default("") String group_sub,
    @Default("") String ic_code,
    @Default("") String ic_name,
    @Default("") String ic_unit_code,
    @Default("") String item_brand,
    @Default("") String item_cat_name,
    @Default("") String item_category,
    @Default("") String main_name,
    @Default("") String sale_price1,
    @Default("") String sub_name,
    @Default("") String unit_code,
    @Default("") String url_image,
  }) = _PosStockItemModel;

  factory PosStockItemModel.fromJson(Map<String, dynamic> json) =>
      _$PosStockItemModelFromJson(json);
}
