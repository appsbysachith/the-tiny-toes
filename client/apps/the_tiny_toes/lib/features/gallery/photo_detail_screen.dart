import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Map<String, dynamic> photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(photo['url'], fit: BoxFit.cover, height: 250),
            const SizedBox(height: 20),
            Text(
              photo['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Album ID: ${photo['albumId']}"),
            Text("Photo ID: ${photo['id']}"),
          ],
        ),
      ),
    );
  }
}
