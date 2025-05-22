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
  HomeCubit(this.dio, this.userInfo): super( const HomeState.initial(),);
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

  Future<PosStockItemModel?> getProductDetailByCode(String code) async {
    try {
      emit(const HomeState.loading());

      print("🔍 Searching for product with code: $code");

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
          "limit": 100
        },
      );

      print("📊 Response status: ${response.statusCode}");
      print("📊 Response type: ${response.data.runtimeType}");

      if (response.statusCode == 200) {
        // Handle the response when it's a List directly
        if (response.data is List) {
          final productList = response.data as List;
          print("📋 List contains ${productList.length} items");

          if (productList.isNotEmpty) {
            // Find the product with matching code
            final matchingProductIndex =
                productList.indexWhere((product) => product['code'] == code);
            print(
                "🔍 Search result for code '$code': index = $matchingProductIndex");

            if (matchingProductIndex != -1) {
              // Found the matching product
              final matchingProduct = productList[matchingProductIndex];
              print("✅ Found matching product: ${matchingProduct['name_1']}");

              final productDetail = PosStockItemModel.fromJson(matchingProduct);
              emit(HomeState.success(posStockDetail: productDetail));
              return productDetail;
            } else {
              // Product code not found in the list
              print("⚠️ No product found with code: $code");
              print(
                  "⚠️ Available codes: ${productList.take(5).map((p) => p['code']).toList()}...");
              emit(HomeState.failure("❌ Product with code $code not found"));
              return null;
            }
          } else {
            // Empty list
            print("⚠️ Product list is empty");
            emit(HomeState.failure("❌ No products returned from API"));
            return null;
          }
        }
        // Handle the response when it's a Map with a 'list' key
        else if (response.data is Map) {
          print("📊 Response is a Map");

          if (response.data.containsKey('list') &&
              response.data['list'] is List) {
            final productList = response.data['list'] as List;
            print("📋 List contains ${productList.length} items");

            if (productList.isNotEmpty) {
              // Find the product with matching code
              final matchingProductIndex =
                  productList.indexWhere((product) => product['code'] == code);
              print(
                  "🔍 Search result for code '$code': index = $matchingProductIndex");

              if (matchingProductIndex != -1) {
                // Found the matching product
                final matchingProduct = productList[matchingProductIndex];
                print("✅ Found matching product: ${matchingProduct['name_1']}");

                final productDetail =
                    PosStockItemModel.fromJson(matchingProduct);
                emit(HomeState.success(posStockDetail: productDetail));
                return productDetail;
              } else {
                // Product code not found in the list
                print("⚠️ No product found with code: $code");
                emit(HomeState.failure("❌ Product with code $code not found"));
                return null;
              }
            } else {
              // Empty list
              print("⚠️ Product list is empty");
              emit(HomeState.failure("❌ No products returned from API"));
              return null;
            }
          } else {
            // No 'list' key in Map response
            print("⚠️ Response does not contain a 'list' key");
            emit(HomeState.failure("❌ Invalid API response format"));
            return null;
          }
        } else {
          // Unknown response type
          print("⚠️ Unexpected response type: ${response.data.runtimeType}");
          emit(HomeState.failure("❌ Unexpected API response format"));
          return null;
        }
      } else {
        // API request failed
        print("⚠️ API request failed with status: ${response.statusCode}");
        emit(HomeState.failure(
            "❌ API request failed with status: ${response.statusCode}"));
        return null;
      }
    } catch (e) {
      return null;
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
