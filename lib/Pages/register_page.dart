import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/header_register.dart';
import 'package:tubes/Widget/next_button_register.dart';
import 'package:tubes/Widget/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              HeaderRegister(),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  children: <Widget>[
                    RegisterForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
