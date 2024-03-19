import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
            color: Color(
                0xFF54d4da)), // Ubah warna border sesuai kode warna yang Anda berikan
      ),
      child: Center(
        child: Text(
          "Masuk",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Color(
                0xFF54d4da), // Ubah warna teks sesuai kode warna yang Anda berikan
          ),
        ),
      ),
    );
  }
}
