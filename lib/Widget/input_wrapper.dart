import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

import 'button.dart';
import 'input_field.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: normalWhite, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          SizedBox(
            height: 40,
          ),
          Button(),
          Text(
            "Belum Punya Akun?",
            style: TextStyle(
                color: normalWhite,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          Text(
            "Daftar",
            style: TextStyle(
              color: normalWhite,
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.combine([
                TextDecoration.underline, // Menambahkan garis bawah
              ]),
              decorationColor: Colors.white, // Warna garis bawah
              decorationStyle:
                  TextDecorationStyle.solid, // Gaya garis bawah (lurus)
            ),
          )
        ],
      ),
    );
  }
}
