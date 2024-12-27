import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_product_model.freezed.dart';
part 'filter_product_model.g.dart';

@freezed
class FilterProductModel with _$FilterProductModel {
  const factory FilterProductModel({
    @Default(0) int id,
    @Default("") String title,
  }) = _FilterProductModel;

  factory  FilterProductModel .fromJson(Map<String , dynamic> json) => _$FilterProductModelFromJson(json);

}