import 'package:app_flutter_starter_for_job/src/module/history/presentation/page/history.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/pos_stock_item_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/dash_board.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/detail_page.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/home_page.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/search/search_page.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cart.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/page/login_page.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/presentation/page/customer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: DashBoardRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        // AutoRoute(page: DetailProductRoute.page),
      ];
}
