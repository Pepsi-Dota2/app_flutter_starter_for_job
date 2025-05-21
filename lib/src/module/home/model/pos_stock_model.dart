import 'package:freezed_annotation/freezed_annotation.dart';
import 'pos_stock_item_model.dart';

part 'pos_stock_model.freezed.dart';
part 'pos_stock_model.g.dart';

@freezed
class PosStockModel with _$PosStockModel {
  const factory PosStockModel({
    @Default(false) bool has_more,
    @Default(0) limit,
    @Default([]) List<PosStockItemModel> list,
    @Default(0) int page,
    @Default(0) int total_rows,

  }) = _PosStockModel;

  factory PosStockModel.fromJson(Map<String, dynamic> json) =>
      _$PosStockModelFromJson(json);
}
