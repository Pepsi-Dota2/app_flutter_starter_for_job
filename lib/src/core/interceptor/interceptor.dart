import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

final secureStorage = FlutterSecureStorage();

class FirebaseTokenInterceptor extends Interceptor {
  final Dio dio;

  FirebaseTokenInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the token to the Authorization header
    final accessToken = await secureStorage.read(key: 'access_token');
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401) {
      // Token expired: refresh and retry the request
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final newToken = await user.getIdToken(true); // Force refresh
        await secureStorage.write(key: 'access_token', value: newToken);

        // Retry the failed request with the new token
        e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        handler.resolve(await dio.fetch(e.requestOptions));
      } else {
        print('No user found. Logging out...');
        handler.reject(e);
      }
    } else {
      handler.next(e);
    }
  }
}
