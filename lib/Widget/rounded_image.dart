import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const RoundedImage({
    required this.imagePath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}