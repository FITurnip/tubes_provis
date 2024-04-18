import 'package:flutter/material.dart';
import 'package:tubes/Widget/header_register.dart';
import 'package:tubes/Widget/stepper_custom.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeaderRegister(),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Row(
              children: [StepperCustom()],
            )
          ],
        ),
      ),
    );
  }
}
