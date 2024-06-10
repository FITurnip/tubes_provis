import 'package:flutter/material.dart';
import 'package:tubes/Services/network.dart';

class ImageViewerPage extends StatelessWidget {
  final String url;

  ImageViewerPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Viewer"),
      ),
      body: Center(
        child: Image.network(Network().getStorageUrl(url)),
      ),
    );
  }
}