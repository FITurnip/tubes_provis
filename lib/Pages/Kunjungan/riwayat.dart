import 'package:flutter/material.dart';
import 'package:tubes/Widget/list_janji.dart';
import 'package:tubes/theme.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.all(25.0),
          child:
              Text('Riwayat Anda', style: getDefaultTextStyle(font_size: 20)),
        ),
      )),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0), child: Container()),
    );
  }
}
