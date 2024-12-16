import 'package:app_flutter_starter_for_job/src/module/home/presentation/page/home_page.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/page/login_page.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
