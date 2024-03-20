import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(color: defBlue))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Masukkan Email Anda",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(color: defBlue))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Masukkan Password Anda",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
