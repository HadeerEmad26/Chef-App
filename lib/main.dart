import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/auth/presentation/auth_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/home/cubit/home_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'core/services/service_locator.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    initServiceLoactor();
    await sl<CacheHelper>().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<GlobalCubit>()..getCachedLang(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<MenuCubit>()..getAllMeals(),
        ),

        BlocProvider(
          create: (context) => sl<ProfileCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<ChangePasswordCubit>(),
        ),

        ChangeNotifierProvider(create: (_) =>AppProviders() ,)

      ],
      child: const MyApp(),
    ),
  );
}
