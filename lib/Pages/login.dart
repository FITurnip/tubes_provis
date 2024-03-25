import 'package:flutter/material.dart';

import 'package:tubes/Widget/Header.dart';
import 'package:tubes/Widget/inputWrapper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan.shade300,
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
