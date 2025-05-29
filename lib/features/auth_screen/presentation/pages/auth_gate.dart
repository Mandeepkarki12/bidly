import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: Text(
              'error: No data received from Supabase',
              style: const AppTextStyles(color: Colors.white).baseBodySpaceMono,
            ));
          } else {
            if (snapshot.data!.session != null) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }
        });
  }
}
