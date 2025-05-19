import 'package:freezed_annotation/freezed_annotation.dart';
import 'pos_stock_item_model.dart';

part 'pos_stock_model.freezed.dart';
part 'pos_stock_model.g.dart';

@freezed
class PosStockModel with _$PosStockModel {
  const factory PosStockModel({
    @Default([]) List<PosStockItemModel> list,
  }) = _PosStockModel;

  factory PosStockModel.fromJson(Map<String, dynamic> json) =>
      _$PosStockModelFromJson(json);
}
