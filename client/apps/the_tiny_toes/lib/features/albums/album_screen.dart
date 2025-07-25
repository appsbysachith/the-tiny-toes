import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/album_provider.dart';

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
    Provider.of<AlbumsProvider>(
      context,
      listen: false,
    ).fetchAlbums(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlbumsProvider>(context);
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
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
            );
          },
        ),
        _ => const SizedBox(),
      },
    );
  }
}
