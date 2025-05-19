
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class GetProductionModel with _$GetProductionModel {
  const factory GetProductionModel({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) int price,
    @Default('') String description,
    @Default([]) List<String> images,
  }) = _GetProductionModel;
  factory GetProductionModel.fromJson(Map<String, dynamic> json) => _$GetProductionModelFromJson(json);
}
