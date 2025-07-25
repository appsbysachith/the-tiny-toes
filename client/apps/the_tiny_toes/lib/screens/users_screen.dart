import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/users_provider.dart';
import '../features/albums/album_screen.dart'; // ✅ Import AlbumsScreen

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UsersProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsersProvider>(context);
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: switch (state) {
        UsersState.loading => const Center(child: CircularProgressIndicator()),
        UsersState.error => Center(
          child: Text(provider.errorMessage ?? 'Error loading users'),
        ),
        UsersState.success => ListView.builder(
          itemCount: provider.users.length,
          itemBuilder: (context, index) {
            final user = provider.users[index];
            return ListTile(
              title: Text(user['name']),
              subtitle: Text(user['email']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AlbumsScreen(userId: user['id']),
                  ),
                );
              },
            );
          },
        ),
        _ => const SizedBox(),
      },
    );
  }
}
