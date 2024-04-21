import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Navigate back to the previous page
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 30,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 60, // Adjust the width of the image
              height: 58, // Adjust the height of the image
              child: Image.asset("assets/img/Logo.png"),
            ),
          ),
          Center(
            child: Text(
              "Registrasi",
              style: getDefaultTextStyle(
                font_size: 24,
                font_weight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
