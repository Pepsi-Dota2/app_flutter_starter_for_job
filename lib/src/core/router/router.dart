import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/dash_board.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/detail_page.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/home_page.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/search/search_page.dart';
import 'package:app_flutter_starter_for_job/src/module/location/presentation/page/location.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/page/login_page.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/page/notification.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/page/profile_page.dart';
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
        AutoRoute(page: LocationRoute.page),
        AutoRoute(page: DetailProductRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
