import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.backGroundPrimary,
            body: Center(
                child: Text(
              'No Routes Found !!',
              style:
                  const AppTextStyles(color: AppColors.primaryText).h1SpaceMono,
            )),
          );
        });
    }
  }
}
