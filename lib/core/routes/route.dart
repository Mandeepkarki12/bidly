import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/try_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tryPage:
        return MaterialPageRoute(builder: (_) => const TryPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
                child: Text(
              'No Routes Found !!',
              style: const AppTextStyles(color: Colors.black).h1SpaceMono,
            )),
          );
        });
    }
  }
}
