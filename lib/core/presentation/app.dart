import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';

import '/generated/l10n.dart';
import '/core/shared/auto_route/router.dart';
import '/core/shared/config/api_config.dart';

import '/core/shared/config/environment_config.dart';
import '/features/login/domain/bloc/login_bloc/login_bloc.dart';
import '/core/data/repository/implementation/local_storage_repository.dart';

/// MyApp Widget
///
/// The main entry point for the Flutter application. It sets up
/// the application's configuration, theme, routing, and providers.
///
/// Example usage:
///
/// ```dart
/// MyApp(
///   getIt: GetIt.instance,
///   apiConfig: ApiConfig(),
///   environmentConfig: EnvironmentConfig(),
/// )
/// ```
class MyApp extends StatefulWidget {
  final GetIt getIt;
  final ApiConfig apiConfig;
  final EnvironmentConfig environmentConfig;

  /// Creates a [MyApp] with the provided [getIt], [apiConfig], and [environmentConfig].
  const MyApp({
    Key? key,
    required this.getIt,
    required this.apiConfig,
    required this.environmentConfig,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    /// Initialize ScreenUtil for responsive design
    ScreenUtil.init(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (context, child) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LocalStorageRepository>(
            create: (context) => widget.getIt<LocalStorageRepository>(),
          ),
          RepositoryProvider<ApiConfig>(
            create: (context) => widget.apiConfig,
          ),
          RepositoryProvider<EnvironmentConfig>(
            create: (context) => widget.environmentConfig,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(
                localStorageRepository: context.read<LocalStorageRepository>(),
              ),
            ),
          ],
          child: MaterialApp.router(
            theme: ThemeData(
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ColorsRepository.realBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                color: ColorsRepository.realBlue,
              ),
            ),
            debugShowCheckedModeBanner: false,
            routeInformationParser:
                widget.getIt<AppRouter>().defaultRouteParser(),
            routerDelegate: widget.getIt<AppRouter>().delegate(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder: (context, child) {
              return Builder(
                builder: (context) {
                  final mediaQuery = MediaQuery.of(context);
                  return MediaQuery(
                    data: mediaQuery.copyWith(
                      accessibleNavigation: false,
                    ),
                    child: child!,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
