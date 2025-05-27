import 'package:bidly/core/secrets/app_secrets.dart';
import 'package:bidly/features/auth_screen/data/datasources/auth_remote_datasource.dart';
import 'package:bidly/features/auth_screen/data/repositories/auth_repository_impl.dart';
import 'package:bidly/features/auth_screen/domain/repositories/auth_repository.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_login.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_signup.dart';
import 'package:bidly/features/auth_screen/domain/usecases/verify_email_otp.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final stl = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  stl.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  stl.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        supabaseClient: stl<SupabaseClient>(),
      ));

  stl.registerFactory<AuthRepository>(() => AuthRemoteRepositoryImpl(
        authRemoteDataSource: stl<AuthRemoteDataSource>(),
      ));

  stl.registerFactory(() => UserSignup(authRepository: stl<AuthRepository>()));

  stl.registerFactory(() => UserLogin(authRepository: stl<AuthRepository>()));

  stl.registerFactory(
      () => VerifyEmailOtp(authRepository: stl<AuthRepository>()));

  stl.registerLazySingleton(() => AuthScreenBloc(
      userSignup: stl<UserSignup>(),
      userLogin: stl<UserLogin>(),
      verifyEmailOtp: stl<VerifyEmailOtp>()));
}
