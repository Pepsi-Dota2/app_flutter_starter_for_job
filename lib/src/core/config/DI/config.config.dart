// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_flutter_starter_for_job/src/core/config/DI/module.dart'
    as _i519;
import 'package:app_flutter_starter_for_job/src/core/router/router.dart'
    as _i884;
import 'package:app_flutter_starter_for_job/src/core/service/api_auth.dart'
    as _i222;
import 'package:app_flutter_starter_for_job/src/module/login/data/datasource/login_local_datasource.dart'
    as _i723;
import 'package:app_flutter_starter_for_job/src/module/login/data/datasource/remote_login_datasource.dart'
    as _i1011;
import 'package:app_flutter_starter_for_job/src/module/login/data/repository/repository_impl.dart'
    as _i32;
import 'package:app_flutter_starter_for_job/src/module/login/domain/repository/repository.dart'
    as _i1062;
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart'
    as _i406;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i884.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => injectableModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i723.LoginLocalDatasource>(
        () => _i723.LoginLocalDatasourceImpl());
    gh.lazySingleton<_i1011.LoginRemoteDatasource>(
        () => _i1011.RemoteLoginDatasource());
    gh.lazySingleton<_i222.ApiAuth>(() => _i222.ApiAuth(gh<_i361.Dio>()));
    gh.lazySingleton<_i1062.LoginRepository>(() => _i32.LoginRepositoryImpl(
          gh<_i723.LoginLocalDatasource>(),
          loginRemoteDatasource: gh<_i1011.LoginRemoteDatasource>(),
        ));
    gh.lazySingleton<_i406.LoginUseCase>(
        () => _i406.LoginUseCase(gh<_i1062.LoginRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i519.InjectableModule {}
