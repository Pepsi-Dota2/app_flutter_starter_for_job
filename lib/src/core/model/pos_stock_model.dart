import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_stock_model.freezed.dart';
part 'pos_stock_model.g.dart';

@freezed
class PosStockModel with _$PosStockModel {
  const factory PosStockModel({
    @Default("") String wh_code,
    @Default("") String sh_code,
    @Default("") String cust_group_main,
    @Default("") String cust_group_sub,
    @Default("") String currency_code,
  }) = _PosStockModel;
  factory PosStockModel.fromJson(Map<String, dynamic> json) =>
      _$PosStockModelFromJson(json);
}
