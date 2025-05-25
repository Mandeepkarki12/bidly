import 'package:bidly/core/routes/route.dart';
import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/secrets/app_secrets.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/features/auth_screen/data/datasources/auth_remote_datasource.dart';
import 'package:bidly/features/auth_screen/data/repositories/auth_repository_impl.dart';
import 'package:bidly/features/auth_screen/domain/usecases/user_signup.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supaBase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthScreenBloc(
              userSignup: UserSignup(
                  authRepository: AuthRemoteRepositoryImpl(
                      authRemoteDataSource: AuthRemoteDataSourceImpl(
                          supabaseClient: supaBase.client)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bidly',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backGroundPrimary,
          useMaterial3: true),
      initialRoute: RouteNames.signupScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
