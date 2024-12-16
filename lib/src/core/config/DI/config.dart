import 'package:app_flutter_starter_for_job/firebase_options.dart';
import 'package:app_flutter_starter_for_job/src/core/config/DI/config.config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies()async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return getIt.init();
}