import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    @Default("N/A") String address,
    @Default("N/A") String adress1,
    @Default("") String area_code,
    @Default(0) int credit_status,
    @Default("") String cust_code,
    @Default("") String cust_name,
    @Default("") String group_main_name,
    @Default("") String group_sub_name,
    @Default("") String latlng,
    @Default("") String logistic_area,
    @Default("") String telephone,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
