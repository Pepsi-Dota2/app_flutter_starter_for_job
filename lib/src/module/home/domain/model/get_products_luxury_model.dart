import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_products_luxury_model.freezed.dart';
part 'get_products_luxury_model.g.dart';

@freezed
class GetProductModel with _$GetProductModel {
  const factory GetProductModel({
    @Default(0) int id,
    @Default("") String title,
    @Default(0) int price,
    @Default([]) List<CategoryModel> category,
    @Default("")  String description,
    @Default([]) List<String> images,
  }) = _GetProductModel;

  factory GetProductModel.fromJson(Map<String, dynamic> json) => _$GetProductModelFromJson(json);
}
