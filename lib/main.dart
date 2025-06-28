import 'package:bidly/core/routes/route.dart';
import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/utils/injection_container.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/home_screen/presentation/bloc/home_screen_bloc.dart';
import 'package:bidly/features/product_upload_screen/presentation/bloc/product_upload_screen_bloc.dart';
import 'package:bidly/features/profile_screen/presentation/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => stl<AuthScreenBloc>(),
      ),
      BlocProvider(
        create: (_) => stl<ProfileScreenBloc>(),
      ),
      BlocProvider(create: (_) => stl<HomeScreenBloc>()),
      BlocProvider(create: (_) => stl<ProductUploadScreenBloc>()),
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
      initialRoute: RouteNames.productUploadScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
