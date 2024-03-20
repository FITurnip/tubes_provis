import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 34,
      decoration: BoxDecoration(
        color: normalWhite,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
            color:
                defBlue), // Ubah warna border sesuai kode warna yang Anda berikan
      ),
      child: Center(
        child: Text(
          "Masuk",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color:
                defBlue, // Ubah warna teks sesuai kode warna yang Anda berikan
          ),
        ),
      ),
    );
  }
}
