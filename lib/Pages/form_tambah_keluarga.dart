import 'package:flutter/material.dart';
import 'package:tubes/Widget/header_tambah_keluarga.dart';
import 'package:tubes/Widget/tambah_keluarga.dart';

class tambahkeluargaPage extends StatelessWidget {
  const tambahkeluargaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              HeaderTambahKeluarga(),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  children: <Widget>[
                    tambahkeluarga(),
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
