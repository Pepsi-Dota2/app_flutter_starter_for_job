import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/model/customer_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  final CodeModel userInfo = CodeModel();
  getIt.registerSingleton<CodeModel>(userInfo);
  getIt.registerSingleton<CustomerModel>(
    CustomerModel(),
  );
  await configureDependencies();
  WebViewPlatform.instance;
  runApp(MyAppLication());
}

class MyAppLication extends StatelessWidget {
  MyAppLication({super.key});
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
