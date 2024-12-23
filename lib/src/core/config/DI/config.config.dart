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
import 'package:app_flutter_starter_for_job/src/core/service/api_service.dart'
    as _i845;
import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/local_datasource.dart'
    as _i616;
import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/remote_datasource.dart'
    as _i622;
import 'package:app_flutter_starter_for_job/src/module/home/data/repository/category_repository_impl.dart'
    as _i549;
import 'package:app_flutter_starter_for_job/src/module/home/data/repository/get_all_product_repository_impl.dart'
    as _i446;
import 'package:app_flutter_starter_for_job/src/module/home/data/repository/production_repository_impl.dart'
    as _i1000;
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/all_product_repository.dart'
    as _i854;
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/category_repository.dart'
    as _i490;
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/product_repository.dart'
    as _i697;
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/category_usecase.dart'
    as _i1054;
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/get_all_product_usecase.dart'
    as _i715;
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/product_usecase.dart'
    as _i797;
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
import 'package:app_flutter_starter_for_job/src/module/profile/data/datasource/profile_remote_datasource.dart'
    as _i215;
import 'package:app_flutter_starter_for_job/src/module/profile/data/repository/logout_repository_impl.dart'
    as _i889;
import 'package:app_flutter_starter_for_job/src/module/profile/data/repository/profile_repository_impl.dart'
    as _i36;
import 'package:app_flutter_starter_for_job/src/module/profile/domain/repository/logout_repository.dart'
    as _i796;
import 'package:app_flutter_starter_for_job/src/module/profile/domain/repository/profile_repository.dart'
    as _i365;
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/logout_usecase.dart'
    as _i709;
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/profile_usecase.dart'
    as _i571;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
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
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i723.LoginLocalDatasource>(
        () => _i723.LoginLocalDatasourceImpl());
    gh.lazySingleton<_i616.LocalDatasource>(
        () => _i616.ProductLocalDatasource());
    gh.lazySingleton<_i845.AppApi>(() => _i845.AppApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i1011.LoginRemoteDatasource>(
        () => _i1011.RemoteLoginDatasource(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i215.ProfileRemoteDatasource>(() =>
        _i215.ProfileRemoteDatasourceImpl(
            firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i365.ProfileRepository>(() => _i36.ProfileRepositoryImpl(
        profileRemoteDatasource: gh<_i215.ProfileRemoteDatasource>()));
    gh.lazySingleton<_i622.RemoteDatasource>(
        () => _i622.ProductRemoteDatasource(gh<_i845.AppApi>()));
    gh.lazySingleton<_i571.ProfileUseCase>(() =>
        _i571.ProfileUseCase(profileRepository: gh<_i365.ProfileRepository>()));
    gh.lazySingleton<_i697.ProductRepository>(
        () => _i1000.ProductionRepositoryImpl(
              gh<_i616.LocalDatasource>(),
              remoteDatasource: gh<_i622.RemoteDatasource>(),
            ));
    gh.lazySingleton<_i796.LogoutRepository>(() => _i889.LogoutRepositoryImpl(
        profileRemoteDatasource: gh<_i215.ProfileRemoteDatasource>()));
    gh.lazySingleton<_i709.LogoutUseCase>(() =>
        _i709.LogoutUseCase(logoutRepository: gh<_i796.LogoutRepository>()));
    gh.lazySingleton<_i854.GetAllProductRepository>(() =>
        _i446.GetAllProductRepositoryImpl(
            remoteDatasource: gh<_i622.RemoteDatasource>()));
    gh.lazySingleton<_i1062.LoginRepository>(() => _i32.LoginRepositoryImpl(
          gh<_i723.LoginLocalDatasource>(),
          loginRemoteDatasource: gh<_i1011.LoginRemoteDatasource>(),
        ));
    gh.lazySingleton<_i490.CategoryRepository>(() =>
        _i549.CategoryRepositoryImpl(
            remoteDatasource: gh<_i622.RemoteDatasource>()));
    gh.lazySingleton<_i715.GetAllProductUseCase>(
        () => _i715.GetAllProductUseCase(gh<_i854.GetAllProductRepository>()));
    gh.lazySingleton<_i406.LoginUseCase>(
        () => _i406.LoginUseCase(gh<_i1062.LoginRepository>()));
    gh.lazySingleton<_i797.ProductUseCase>(
        () => _i797.ProductUseCase(gh<_i697.ProductRepository>()));
    gh.lazySingleton<_i1054.CategoryUsecase>(
        () => _i1054.CategoryUsecase(gh<_i490.CategoryRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i519.InjectableModule {}
