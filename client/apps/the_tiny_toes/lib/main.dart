import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:the_tiny_toes/core/providers/users_provider.dart';

import 'core/providers/auth_provider.dart';
import 'core/providers/album_provider.dart';

import 'features/auth/login_screen.dart';
import 'screens/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => AlbumsProvider()),
      ],
      child: const MaterialAppWrapper(),
    );
  }
}

class MaterialAppWrapper extends StatefulWidget {
  const MaterialAppWrapper({super.key});

  @override
  State<MaterialAppWrapper> createState() => _MaterialAppWrapperState();
}

class _MaterialAppWrapperState extends State<MaterialAppWrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.loadLoggedInUser();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (_isLoading) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      title: 'The Tiny Toes',
      theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: true),
      home: authProvider.isLoggedIn ? const UsersScreen() : const LoginScreen(),
    );
  }
}
