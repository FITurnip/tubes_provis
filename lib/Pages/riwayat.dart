import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/Widget/list_janji.dart';

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
        title: Container(
          padding: EdgeInsets.all(25.0),
          child: Text('Riwayat Anda', style: getDefaultTextStyle(font_size: 20)),
        ),
      )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: listJanji()
      ),
    );
  }
}