import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: defBlue, backgroundColor: normalWhite, // Warna teks
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
          side: BorderSide(color: defBlue),
        ),
        minimumSize: Size(160, 34), // Ukuran minimum tombol
      ),
      onPressed: () {
        // tah keur BE
      },
      child: Text(
        "Masuk",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}
