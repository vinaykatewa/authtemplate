// ignore_for_file: unused_local_variable

import 'package:authtemplate/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:authtemplate/core/secrets/app_secrets.dart';
import 'package:authtemplate/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:authtemplate/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:authtemplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:authtemplate/features/auth/domain/usecases/current_user.dart';
import 'package:authtemplate/features/auth/domain/usecases/user_login.dart';
import 'package:authtemplate/features/auth/domain/usecases/user_sign_up.dart';
import 'package:authtemplate/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton<AppUserCubit>(() =>AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(() =>
        AuthRemoteDataSourceImplementation(supabaseClient: serviceLocator()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImplementation(serviceLocator()))
    ..registerFactory<UserSignUp>(
        () => UserSignUp(authRepository: serviceLocator()))
    ..registerFactory<UserLogin>(() => UserLogin(repository: serviceLocator()))
    ..registerFactory<CurrentUser>(
        () => CurrentUser(repository: serviceLocator()))
    ..registerLazySingleton(() => AuthBlocBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator()),);
}
