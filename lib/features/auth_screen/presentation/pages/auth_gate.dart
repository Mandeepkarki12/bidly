import 'package:bidly/core/services/shared_prefrences.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final SecureStorageService _storageService = SecureStorageService();
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Check if user_id exists in SharedPreferences
    final userId = await _storageService.getValue(key: 'user_id');
    setState(() {
      _isLoggedIn = userId != null && userId.isNotEmpty;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _isLoggedIn ? const HomeScreen() : const LoginScreen();
  }
}
