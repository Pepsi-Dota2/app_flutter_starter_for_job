import 'package:app_flutter_starter_for_job/src/module/cart/model/bills_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_bill_model.freezed.dart';
part 'check_bill_model.g.dart';

@freezed
class CheckBillModel with _$CheckBillModel {
  const factory CheckBillModel({
    @Default('') String doc_no,
    @Default('') String cust_code,
    @Default('') String sale_code,
    @Default('') String side_code,
    @Default('') String department_code,
    @Default('') String wh_code,
    @Default('') String sh_code,
    @Default(0) int total_amount,
    @Default(0) int total_amount_2,
    @Default([]) List<BillsModel> bill,
  }) = _CheckBillModel;

  factory CheckBillModel.fromJson(Map<String, dynamic> json) =>
      _$CheckBillModelFromJson(json);
}
