import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 60, // Atur lebar gambar
              height: 58, // Atur tinggi gambar
              child: Image.asset("assets/img/Logo.png"),
            ),
          ),
          Center(
            child: Text(
              "Registrasi",
              style: getDefaultTextStyle(
                  font_size: 24, font_weight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
