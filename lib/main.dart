import 'package:bidly/core/routes/route.dart';
import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: RouteNames.tryPage,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
