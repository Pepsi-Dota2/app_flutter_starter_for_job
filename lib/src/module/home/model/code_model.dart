import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_model.freezed.dart';
part 'code_model.g.dart';

@freezed
class CodeModel with _$CodeModel {
  const factory CodeModel({
    @Default("") String area_code,
    @Default("") String bu_code,
    @Default("") String code,
    @Default("") String cust_group_main,
    @Default(0) int cust_group_sub,
    @Default("") String department,
    @Default("") String ic_shelf,
    @Default("") String ic_wht,
    @Default("") String logistic_code,
    @Default("") String name_1,
    @Default("") String side,
    @Default("") String title,
  }) = _CodeModel;

  factory CodeModel.fromJson(Map<String, dynamic> json) =>
      _$CodeModelFromJson(json);
}
