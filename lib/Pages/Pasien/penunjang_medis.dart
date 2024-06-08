import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class PenunjangMedis extends PasienTemplate {
  PenunjangMedis({required JanjiTemu janji_temu, required Kunjungan kunjungan}) : super(title: "Penunjang Medis", pasienTemplateItems: [], qrData: "", janjiTemu: janji_temu, kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
        headerValue: "CT Scan Abdomen",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Surat Pengantar", style: getDefaultTextStyle())),
                TableCell(child: Text("Lihat", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Hasil Lab", style: getDefaultTextStyle())),
                TableCell(child: Text("Lihat", style: getDefaultTextStyle())),
              ],
            )
          ],
        )
      ),
      ExpansibleItem(
        headerValue: "Tes Darah Lengkap",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Surat Pengantar", style: getDefaultTextStyle())),
                TableCell(child: Text("Lihat", style: getDefaultTextStyle())), // ganti jadi modal button
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Hasil Lab", style: getDefaultTextStyle())),
                TableCell(child: Text("Lihat", style: getDefaultTextStyle())), // ganti jadi modal button
              ],
            )
          ],
        )
      ),
    ];
  }
}