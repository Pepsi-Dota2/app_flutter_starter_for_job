import 'dart:convert';
import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final Dio dio;
  HomeCubit(this.dio, this.userInfo) : super(const HomeState.initial());
  final CodeModel userInfo;
  Future<void> getProduct() async {
    emit(const HomeState.loading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cachedData = prefs.getString('cached_products');
      final int? cacheTimestamp = prefs.getInt('products_cache_timestamp');
      final bool isCacheValid = cacheTimestamp != null &&
          DateTime.now().millisecondsSinceEpoch - cacheTimestamp < 3600000;
      if (cachedData != null && isCacheValid) {
        final List<dynamic> dataList = jsonDecode(cachedData);
        final products =
            dataList.map((e) => PosStockItemModel.fromJson(e)).toList();
        emit(HomeState.success(
          posStock: products,
          currentPage: 1,
          hasMorePages: false,
          totalItems: 10,
        ));
        return;
      }
      final response = await dio.post(
        ApiPath.posStock,
        data: {
          "wh_code": userInfo.ic_wht,
          "sh_code": userInfo.ic_shelf,
          "cust_group_main": userInfo.cust_group_main,
          "cust_group_sub": userInfo.cust_group_sub.toString(),
          "group_main": "14",
          "currency_code": "01",
          "page": 1,
          "limit": 20,
        },
      );
      if (response.statusCode == 200 && response.data['list'] != null) {
        final List<dynamic> dataList = response.data['list'];
        final products =
            dataList.map((e) => PosStockItemModel.fromJson(e)).toList();

        await prefs.setString('cached_products', jsonEncode(dataList));
        await prefs.setInt(
            'products_cache_timestamp', DateTime.now().millisecondsSinceEpoch);

        final int totalItems = response.data['totalItems'] ?? products.length;
        final int currentPage = response.data['page'] ?? 1;
        final bool hasMorePages =
            (response.data['totalPages'] ?? 1) > currentPage;
        emit(HomeState.success(
          posStock: products,
          currentPage: currentPage,
          hasMorePages: hasMorePages,
          totalItems: totalItems,
        ));
      } else {
        emit(const HomeState.failure("Invalid response from server."));
      }
    } catch (e) {
      emit(HomeState.failure(e.toString()));
    }
  }
}
