import 'package:flutter/material.dart';
import 'package:tubes/Widget/store_update_keluarga.dart';
import 'package:tubes/theme.dart';

class StoreUpdateKeluargaPage extends StatelessWidget {
  const StoreUpdateKeluargaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
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
                        "keluarga",
                        style: getDefaultTextStyle(
                            font_size: 24, font_weight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  children: <Widget>[
                    StoreUpdateKeluarga(),
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
