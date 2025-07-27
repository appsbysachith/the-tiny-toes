import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_tiny_toes/shared/widgets/shared_navbar.dart';
import '../../core/providers/photos_provider.dart';
import "../gallery/photo_detail_screen.dart";

class GalleryScreen extends StatefulWidget {
  final int albumId;

  const GalleryScreen({super.key, required this.albumId});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PhotosProvider>(
        context,
        listen: false,
      ).fetchPhotos(widget.albumId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotosProvider>(context);
    final state = provider.state;

    return Scaffold(
      appBar: SharedNavbar(title: "Gallery screen"),

      body: switch (state) {
        PhotosState.loading => const Center(child: CircularProgressIndicator()),
        PhotosState.error => Center(
          child: Text(provider.errorMessage ?? 'Error loading photos'),
        ),
        PhotosState.success => GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: provider.photos.length,
          itemBuilder: (context, index) {
            final photo = provider.photos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PhotoDetailScreen(photo: photo),
                  ),
                );
              },
              child: Image.network(photo['thumbnailUrl'], fit: BoxFit.cover),
            );
          },
        ),
        _ => const SizedBox(),
      },
    );
  }
}
