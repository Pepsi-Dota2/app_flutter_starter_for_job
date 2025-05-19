import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("🔍 Response structure: ${response.data.runtimeType}");
        if (response.data is Map && response.data.containsKey('list')) {
          print("📦 Found 'list' key in response");
          response.data = response.data['list'];
        }

        handler.next(response);
      },
      onError: (DioException error, handler) {
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));

    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
