import 'package:app_flutter_starter_for_job/src/core/keys/keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LoginLocalDatasource {
  Future<void> saveUser({required String uid});
  Future<String> getUser();
  Future<void> deleteUser();
}

@LazySingleton(as: LoginLocalDatasource)
class LoginLocalDatasourceImpl implements LoginLocalDatasource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> saveUser({required String uid}) async {
    await _storage.write(key: KeyConstants.uid, value: uid);
  }

  @override
  Future<String> getUser() async {
    return await _storage.read(key: KeyConstants.uid) ?? "";
  }

  @override
  Future<void> deleteUser() async {
    await _storage.delete(key: KeyConstants.uid);
  }
}
