import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class PenunjangMedis extends PasienTemplate {
  // di sini nanti, tambahin fitur sorting berdasarkan tanggal dan filtering berdasarkan surat pengantar atau hasil
  PenunjangMedis({required JanjiTemu janji_temu}) : super(title: "Penunjang Medis", pasienTemplateItems: [], qrData: "", janjiTemu: janji_temu) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
        headerValue: "CT Scan Abdomen",
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