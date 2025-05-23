import 'package:app_flutter_starter_for_job/src/core/config/DI/config.config.dart';
import 'package:app_flutter_starter_for_job/src/core/config/observe.dart';
import 'package:app_flutter_starter_for_job/src/module/cart/presentation/page/cubit/cart_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/history/presentation/cubit/history_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<GetIt> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
  getIt.registerFactory<CustomerCubit>(() => CustomerCubit());
  getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<Dio>(), getIt<CodeModel>()));
  return getIt.init();
}
