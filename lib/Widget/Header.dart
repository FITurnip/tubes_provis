import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 120, // Atur lebar gambar
              height: 250, // Atur tinggi gambar
              child: Image.asset("assets/img/app_logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
