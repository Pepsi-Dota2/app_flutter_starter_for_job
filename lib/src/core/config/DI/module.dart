import 'package:app_flutter_starter_for_job/src/core/interceptor/interceptor.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
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
    dio.options.connectTimeout = const Duration(seconds: 30 * 1);
    dio.options.receiveTimeout = const Duration(seconds: 30 * 1);
    dio.options.sendTimeout = const Duration(seconds: 30 * 1);
    dio.interceptors.add(FirebaseTokenInterceptor(dio));
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
