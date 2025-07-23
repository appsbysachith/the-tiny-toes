import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/auth_provider.dart';
import '../features/auth/login_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  void _logout(BuildContext context) async {
    await Provider.of<AuthProvider>(context, listen: false).logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<AuthProvider>(context).loggedInUser ?? "User";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, $username!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
