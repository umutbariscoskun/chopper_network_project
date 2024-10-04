import 'package:auto_route/auto_route.dart';
import 'package:chopper_network/core/constants/app_constants.dart';
import 'package:chopper_network/core/di/inject.dart';
import 'package:chopper_network/core/helper/helper_functions.dart';
import 'package:chopper_network/core/routers/route_observers.dart';
import 'package:chopper_network/features/app/presentation/counter/cubit/counter_cubit.dart';
import 'package:chopper_network/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            child: MaterialApp.router(
              routerDelegate: AutoRouterDelegate(
                appRouter,
                navigatorObservers: () => [
                  RouteObservers(),
                ],
              ),
              themeMode: ThemeMode.dark,
              // theme: AppThemeData.appTheme,
              routeInformationParser: appRouter.defaultRouteParser(),
              supportedLocales: AppConstants.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            ),
          );
        },
      ),
    );
  }
}

// import 'package:chopper_network/features/app/presentation/counter/counter.dart';
// import 'package:chopper_network/l10n/l10n.dart';
// import 'package:flutter/material.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//         colorScheme: ColorScheme.fromSwatch(
//           accentColor: const Color(0xFF13B9FF),
//         ),
//       ),
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: const CounterPage(),
//     );
//   }
// }
