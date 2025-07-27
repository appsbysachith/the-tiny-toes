import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tiny_toes/shared/widgets/shared_navbar.dart';

import '../../core/providers/album_provider.dart';
import '../gallery/gallery_screen.dart'; // ✅ Import the gallery screen

class AlbumsScreen extends StatefulWidget {
  final int userId;

  const AlbumsScreen({super.key, required this.userId});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AlbumsProvider>(
        context,
        listen: false,
      ).fetchAlbums(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlbumsProvider>(context);
    final state = provider.state;

    return Scaffold(
      appBar: SharedNavbar(title: "Album screen"),

      body: switch (state) {
        AlbumsState.loading => const Center(child: CircularProgressIndicator()),
        AlbumsState.error => Center(
          child: Text(provider.errorMessage ?? 'Error loading albums'),
        ),
        AlbumsState.success => ListView.builder(
          itemCount: provider.albums.length,
          itemBuilder: (context, index) {
            final album = provider.albums[index];
            return ListTile(
              leading: const Icon(Icons.photo_album),
              title: Text(album['title']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GalleryScreen(albumId: album['id']),
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
