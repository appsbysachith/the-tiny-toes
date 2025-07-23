import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'core/providers/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'The Tiny toes',
        theme: ThemeData(primarySwatch: Colors.pink, useMaterial3: true),
        home: const Placeholder(),
      ),
    );
  }
}
