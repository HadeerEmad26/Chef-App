import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/local/app_localization.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/them/app_them.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) =>
          BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              AppProviders providers = Provider.of(context);
              return MaterialApp(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('ar', "EG"),
                  Locale('en', "US"),
                ],
                locale: Locale
                  (providers.isArabicEnable ? "ar" : "en"),
                  //(BlocProvider.of<GlobalCubit>(context).langCode),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.intitlRoutes,
                onGenerateRoute: AppRoutes.generateRoute,
                title: AppStrings.chefApp,
                theme: getAppTheme(),
                darkTheme: getAppDarkTheme(),
                themeMode: providers.isDarkThemEnable ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),

    );
  }
}
