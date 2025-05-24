// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckBillModelImpl _$$CheckBillModelImplFromJson(Map<String, dynamic> json) =>
    _$CheckBillModelImpl(
      doc_no: json['doc_no'] as String? ?? '',
      cust_code: json['cust_code'] as String? ?? '',
      sale_code: json['sale_code'] as String? ?? '',
      side_code: json['side_code'] as String? ?? '',
      department_code: json['department_code'] as String? ?? '',
      wh_code: json['wh_code'] as String? ?? '',
      sh_code: json['sh_code'] as String? ?? '',
      total_amount: (json['total_amount'] as num?)?.toInt() ?? 0,
      total_amount_2: (json['total_amount_2'] as num?)?.toInt() ?? 0,
      bill: (json['bill'] as List<dynamic>?)
              ?.map((e) => BillsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CheckBillModelImplToJson(
        _$CheckBillModelImpl instance) =>
    <String, dynamic>{
      'doc_no': instance.doc_no,
      'cust_code': instance.cust_code,
      'sale_code': instance.sale_code,
      'side_code': instance.side_code,
      'department_code': instance.department_code,
      'wh_code': instance.wh_code,
      'sh_code': instance.sh_code,
      'total_amount': instance.total_amount,
      'total_amount_2': instance.total_amount_2,
      'bill': instance.bill,
    };
