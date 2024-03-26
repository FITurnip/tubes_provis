import 'package:flutter/material.dart';
import 'package:tubes/Widget/button_swap.dart';
import 'package:tubes/Widget/input_field.dart';
import 'package:tubes/theme.dart';

import 'button_login.dart';

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  String labelText = 'Email';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                  color: normalWhite,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              ButtonSwap(
                onTextChanged: (newText) {
                  setState(() {
                    labelText = newText;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(color: defBlue),
            child: InputField(
              labelText: labelText,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Button(),
          SizedBox(height: 20),
          Text(
            "Belum Punya Akun?",
            style: TextStyle(
              color: normalWhite,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Daftar",
              style: TextStyle(
                color: normalWhite,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.combine([
                  TextDecoration.underline,
                ]),
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
