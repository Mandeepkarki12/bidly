import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/features/auth_screen/presentation/pages/auth_gate.dart';
import 'package:bidly/features/auth_screen/presentation/pages/change_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/forget_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/signup_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.authGate:
        return MaterialPageRoute(builder: (_) => const AuthGate());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
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
