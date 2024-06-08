import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class HasilDiagnosa extends PasienTemplate {
  HasilDiagnosa({super.key, required JanjiTemu janji_temu, required Kunjungan kunjungan}) : super(title: "Hasil Diagnosa", pasienTemplateItems: [], qrData: "", janjiTemu: janji_temu, kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
        icon: const Icon(Icons.sick),
        headerValue: "Keluhan",
        expandedValue: Container(child: Text(janji_temu.detail_keluhan, style: getDefaultTextStyle())),
        isExpanded: true
      ),
      ExpansibleItem(
        icon: const Icon(Icons.done_all),
        headerValue: "Hasil Diagnosa",
        expandedValue: Container(child: Text(kunjungan.diagnosa ?? 'Belum ada diagnosa', style: getDefaultTextStyle()))
      ),
      ExpansibleItem(
        icon: Icon(Icons.rule),
        headerValue: "Aturan Penggunaan Obat",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Obat", style: getDefaultTextStyle(font_weight: FontWeight.bold))),
                TableCell(child: Text("Jum.", style: getDefaultTextStyle(font_weight: FontWeight.bold))),
                TableCell(child: Text("Aturan", style: getDefaultTextStyle(font_weight: FontWeight.bold))),
              ]
            ),
            ...kunjungan.resepObat.map((resep) {
              return TableRow(
                children: [
                  TableCell(child: Text(resep.masterObat.namaObat, style: getDefaultTextStyle())),
                  TableCell(child: Text("${resep.jumlah}", style: getDefaultTextStyle())),
                  TableCell(child: Text(resep.keterangan, style: getDefaultTextStyle())),
                ]
              );
            }),
          ],
        ),
        isExpanded: true
      ),
    ];
  }
}