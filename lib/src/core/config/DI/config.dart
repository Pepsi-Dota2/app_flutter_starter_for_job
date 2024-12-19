import 'package:app_flutter_starter_for_job/firebase_options.dart';
import 'package:app_flutter_starter_for_job/src/core/config/DI/config.config.dart';
import 'package:app_flutter_starter_for_job/src/core/config/observe.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/product_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/home_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/logout_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/profile_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/presentation/cubit/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<GetIt> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<ProductUseCase>()));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileUseCase>(), getIt<LogoutUseCase>()));
  return getIt.init();
}
