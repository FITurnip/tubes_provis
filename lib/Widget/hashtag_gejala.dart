import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class HashtagGejala extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HashtagGejala({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(131, 226, 226, 226), // Warna latar belakang tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Mengatur pinggiran menjadi rounded
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.1), // Menambahkan padding ke teks
        child: Text(
          label,
          style: getDefaultTextStyle(font_size: 10, font_color: Colors.white), // Menyesuaikan ukuran teks sesuai kebutuhan Anda
        ),
      ),
    );
  }
}
