import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class PenunjangMedis extends PasienTemplate {
  // di sini nanti, tambahin fitur sorting berdasarkan tanggal dan filtering berdasarkan surat pengantar atau hasil
  PenunjangMedis() : super(
    qrData: "Hello World",
    pasienTemplateItems: [
      ExpansibleItem(
        icon: Icon(Icons.assignment),
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
        icon: Icon(Icons.assignment),
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
    ]
  );
}