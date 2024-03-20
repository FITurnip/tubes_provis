import 'package:flutter/material.dart';

import 'package:tubes/Widget/header.dart';
import 'package:tubes/Widget/input_wrapper.dart';
import 'package:tubes/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: normalWhite),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: defBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
