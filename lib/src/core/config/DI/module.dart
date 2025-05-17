import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    // Interceptor for logging requests and responses (optional)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));
    
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

}
