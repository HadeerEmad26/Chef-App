import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/auth/data/reposetry/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/auth_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/home/cubit/home_cubit.dart';
import 'package:chef_app/features/menu/data/reposetry/menu_repositry.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLoactor(){
  //cubit
  sl.registerLazySingleton(()=> GlobalCubit());
  sl.registerLazySingleton(()=> LoginCubit(sl()));
  sl.registerLazySingleton(()=> ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(()=> HomeCubit());
  sl.registerLazySingleton(()=> MenuCubit(sl()));


  //auth feature
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => MenuRepository());

  //external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}