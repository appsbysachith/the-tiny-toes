import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Page')),
      body: const Center(
        child: Text(
          'Welcome to the Users Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
