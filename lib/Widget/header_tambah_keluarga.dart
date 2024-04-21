import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class HeaderTambahKeluarga extends StatelessWidget {
  const HeaderTambahKeluarga({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate back when the button is pressed
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 60, // Atur lebar gambar
                height: 58, // Atur tinggi gambar
                child: Image.asset("assets/img/Logo.png"),
              ),
            ],
          ),
          Center(
            child: Text(
              "Tambah keluarga",
              style: getDefaultTextStyle(
                  font_size: 24, font_weight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
