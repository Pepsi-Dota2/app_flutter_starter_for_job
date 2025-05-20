import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
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
  HomeCubit(this.dio, this.userInfo) : super(const HomeState.initial());

  final Dio dio;
  final CodeModel userInfo;
  final ScrollController controller = ScrollController();
  List<PosStockItemModel> items = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  int limit = 10;


  Future<void> getProduct() async {
    isLoading = true;
    try {
      if (page == 1) emit(const HomeState.loading());

      final response = await dio.post(
        ApiPath.posStock,
        data: {
          "wh_code": userInfo.ic_wht,
          "sh_code": userInfo.ic_shelf,
          "cust_group_main": userInfo.cust_group_main,
          "cust_group_sub": userInfo.cust_group_sub.toString(),
          "group_main": "14",
          "currency_code": "01",
          "page": page,
          "limit": limit,
        },
      );

      if (response.statusCode == 200 && response.data['list'] != null) {
        final List<dynamic> dataList = response.data['list'];
        final newItems =
            dataList.map((e) => PosStockItemModel.fromJson(e)).toList();

        items.addAll(newItems);
        final totalItems = response.data['total_rows'] ?? items.length;
        hasMore = response.data['has_more'] ?? false;

        emit(HomeState.success(
          posStock: items,
          currentPage: page,
          hasMorePages: hasMore,
          totalItems: totalItems,
        ));

        page++;
      } else {
        emit(const HomeState.failure("Invalid response from server."));
      }
    } catch (e) {
      emit(HomeState.failure("❌ ${e.toString()}"));
    } finally {
      isLoading = false;
    }
  }
}
