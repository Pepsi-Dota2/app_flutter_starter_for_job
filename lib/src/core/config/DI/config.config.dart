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
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart'
    as _i803;
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart'
    as _i183;
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
    gh.lazySingleton<_i845.AppApi>(() => _i845.AppApi(gh<_i361.Dio>()));
    gh.factory<_i183.HomeCubit>(() => _i183.HomeCubit(
          gh<_i361.Dio>(),
          gh<_i803.CodeModel>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i519.InjectableModule {}
