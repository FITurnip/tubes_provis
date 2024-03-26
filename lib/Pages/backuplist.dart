import 'package:flutter/material.dart';
import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/theme.dart';

class listJanji extends StatelessWidget {
  const listJanji({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: janjiTemuList.length,
        itemBuilder: (BuildContext context, int index) {
          final JanjiTemu item = janjiTemuList[index];
          return Container(
              height: 50,
              color: defBlue,
              child: Center(
                child: Text(item.dokter.nama),
              ));
        });
  }
}
