import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_model.freezed.dart';
part 'get_product_model.g.dart';

@freezed
class GetProductModel with _$GetProductModel {
  const factory GetProductModel({
    @Default(0) int albumId,
    @Default(0) int id,
    @Default("") String title,
    @Default("") String url,
    @Default("") String thumbnailUrl,
  }) = _GetProductModel;

  factory GetProductModel.fromJson(Map<String, dynamic> json) => _$GetProductModelFromJson(json);
}
