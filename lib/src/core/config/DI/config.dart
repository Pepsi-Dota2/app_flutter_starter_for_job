import 'package:app_flutter_starter_for_job/firebase_options.dart';
import 'package:app_flutter_starter_for_job/src/core/config/DI/config.config.dart';
import 'package:app_flutter_starter_for_job/src/core/config/observe.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies()async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    Bloc.observer = SimpleBlocObserver();
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
    return getIt.init();
}