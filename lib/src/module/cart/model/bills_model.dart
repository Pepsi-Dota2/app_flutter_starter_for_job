import 'package:freezed_annotation/freezed_annotation.dart';

part 'bills_model.freezed.dart';
part 'bills_model.g.dart';

@freezed
class BillsModel with _$BillsModel {
  const factory BillsModel({
    @Default('') String item_code,
    @Default('') String item_name,
    @Default('') String unit_code,
    @Default(0) int qty,
    @Default(0) int price,
    @Default(0) int discount,
    @Default(0) int discount_amount,
    @Default(0) int sum_amount,
    @Default(0) int average_cost,
    @Default(0) int price_2,
    @Default(0) int sum_amount_2,
    @Default('') String item_main_code,
    @Default('') String product_type,
  }) = _BillsModel;

  factory BillsModel.fromJson(Map<String, dynamic> json) =>
      _$BillsModelFromJson(json);
}
