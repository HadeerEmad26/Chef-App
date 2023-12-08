import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/auth/presentation/auth_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
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
      ],
      child: const MyApp(),
    ),
  );
}
