import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

import '/core/shared/auto_route/router.dart';
import '/core/shared/config/connectivity_checker.dart';
import '/core/data/repository/implementation/local_storage_repository.dart';

class DependencyInjectionConfig {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    ///Create connectivityWrapper instance
    final connectivityWrapper = ConnectivityWrapper.instance;
    instance.registerSingleton<ConnectivityWrapper>(connectivityWrapper);

    ///Create connectivityChecker class instance
    final connectivityChecker =
    ConnectivityChecker(connectivity: instance<ConnectivityWrapper>());
    instance.registerLazySingleton<ConnectivityChecker>(
          () => connectivityChecker,
    );

    ///Create sharedPreferences instance
    final sharedPreferences = await SharedPreferences.getInstance();
    instance.registerSingleton<SharedPreferences>(sharedPreferences);


    ///Create localStorageRepository class instance
    final localStorageRepository = LocalStorageRepository(sharedPreferences: instance<SharedPreferences>());
    instance.registerLazySingleton<LocalStorageRepository>(() => localStorageRepository);

    ///Create http client instance
    final client = Client();
    instance.registerSingleton<Client>(client);

    instance.registerSingleton<AppRouter>(AppRouter());
  }
}