import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Pembayaran extends PasienTemplate {
  Pembayaran() : super(
    qrData: "Hello World",
    pasienTemplateItems: [
      ExpansibleItem(
        icon: Icon(Icons.sick),
        headerValue: "Keluhan",
        expandedValue: Container(child: Text("Saya mengalami panas badan", style: getDefaultTextStyle())),
        isExpanded: true
      ),
      ExpansibleItem(
        icon: Icon(Icons.assignment),
        headerValue: "Pemeriksaan",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Suhu tubuh", style: getDefaultTextStyle())),
                TableCell(child: Text("37°C", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Detak jangtung", style: getDefaultTextStyle())),
                TableCell(child: Text("70 bpm", style: getDefaultTextStyle())),
              ],
            )
          ],
        )
      ),
      ExpansibleItem(
        icon: Icon(Icons.summarize),
        headerValue: "Hasil Diagnosa",
        expandedValue: Container(child: Text("Anda mengalami demam", style: getDefaultTextStyle()))
      ),
    ]
  );
}