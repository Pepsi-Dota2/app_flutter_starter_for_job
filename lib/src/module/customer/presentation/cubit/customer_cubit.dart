import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart'
    show ApiPath;
import 'package:app_flutter_starter_for_job/src/module/customer/model/customer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_state.dart';
part 'customer_cubit.freezed.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerState.initial());
  Future<void> fetchCustomers() async {
    emit(CustomerState.loading()); 
    try {
      final response = await Dio().get(ApiPath.posCustomer);
      final List<dynamic> dataList = response.data['list'];
      final customers = dataList.map((e) => CustomerModel.fromJson(e)).toList();
      emit(CustomerState.success(customer: customers));
    } catch (e) {
      emit(CustomerState.failure(e.toString())); 
      print("❌ Error: $e");
    }
  }
}
