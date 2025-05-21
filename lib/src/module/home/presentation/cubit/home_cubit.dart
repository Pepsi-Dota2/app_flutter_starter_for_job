import 'dart:async';

import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/core/model/pos_stock_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio, this.userInfo)
      : super(
          const HomeState.initial(),
        );
  final ScrollController scrollController = ScrollController();
  final Dio dio;
  final CodeModel userInfo;
  List<PosStockItemModel> items = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  int limit = 10;
  Timer? debounceTimer;
  Future<void> onRefresh() async {
    page = 1;
    items.clear();
    await getProduct();
  }

  Future<PosStockModel> getProduct() async {
    emit(const HomeState.loading());
    try {
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
          "limit": 10,
        },
      );
      if (response.statusCode == 200 && response.data['list'] != null) {
        final List<dynamic> dataList = response.data['list'];
        final newItems =
            dataList.map((e) => PosStockItemModel.fromJson(e)).toList();
        emit(HomeState.success(
          posStock: newItems,
          currentPage: page,
          hasMorePages: hasMore,
        ));
        return PosStockModel.fromJson(response.data);
      } else {
        emit(const HomeState.failure("Invalid response from server."));
        throw Exception("Invalid response from server.");
      }
    } catch (e) {
      emit(HomeState.failure("❌ ${e.toString()}"));
      throw Exception("❌ ${e.toString()}");
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMoreData() async {
    try {
      final nextPage = page + 1;
      final response = await dio.post(
        ApiPath.posStock,
        data: {
          "wh_code": userInfo.ic_wht,
          "sh_code": userInfo.ic_shelf,
          "cust_group_main": userInfo.cust_group_main,
          "cust_group_sub": userInfo.cust_group_sub.toString(),
          "group_main": "14",
          "currency_code": "01",
          "page": nextPage,
          "limit": limit,
        },
      );
      if (response.statusCode == 200 && response.data['list'] != null) {
        final List<dynamic> dataList = response.data['list'];
        final newItems =
            dataList.map((e) => PosStockItemModel.fromJson(e)).toList();
        if (nextPage == 1) {
          items = newItems;
        } else {
          items.addAll(newItems);
        }
        hasMore = response.data['has_more'] ?? false;
        page = nextPage;
        if (items.length > page * limit) {
          if (items.length > page * limit) {
            items = items.sublist(0, page * limit);
          }
        }
        emit(HomeState.success(
          posStock: items,
          currentPage: page,
          hasMorePages: hasMore,
        ));
      }
    } catch (e) {
      emit(HomeState.failure("❌ ${e.toString()}"));
    }
  }

  Future<PosStockItemModel> getProductDetailByCode(String code) async {
    try {
      final response = await dio.post(
        ApiPath.posStock,
        data: {
          "code": code,
          "wh_code": userInfo.ic_wht,
          "sh_code": userInfo.ic_shelf,
          "currency_code": "01",
          "cust_group_main": userInfo.cust_group_main,
          "cust_group_sub": userInfo.cust_group_sub.toString(),
          "group_main": "14"
        },
      );

      if (response.statusCode == 200 && response.data is Map) {
        return PosStockItemModel.fromJson(response.data);
      } else {
        throw Exception("❌ Product not found");
      }
    } catch (e) {
      throw Exception("❌ Error fetching product by code: $e");
    }
  }

  void scrollListener() {
    if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !scrollController.position.outOfRange &&
          hasMore) {
        loadMoreData();
      }
    });
  }
}
