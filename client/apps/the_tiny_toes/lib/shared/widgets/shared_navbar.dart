import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/auth_provider.dart';
import '../../features/auth/login_screen.dart';

class SharedNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SharedNavbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<AuthProvider>(context).loggedInUser ?? 'User';

    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(
            'Hi, $username',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      leading:
          Navigator.of(context).canPop()
              ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await Provider.of<AuthProvider>(context, listen: false).logout();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (_) => false,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
