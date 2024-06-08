import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/FileViewer/PDFViewer.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class PenunjangMedis extends PasienTemplate {
  PenunjangMedis(BuildContext context, {required JanjiTemu janji_temu, required Kunjungan kunjungan}) : super(title: "Penunjang Medis", pasienTemplateItems: [], qrData: "", janjiTemu: janji_temu, kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ...kunjungan.penunjangMedis.map((item) {
        return ExpansibleItem(
          headerValue: item.masterPenunjangMedis.jenisPenunjangMedis,
          expandedValue: Table(
            children: [
              TableRow(
                children: [
                  TableCell(child: Text("Harga", style: getDefaultTextStyle())),
                  TableCell(child: Text("${item.masterPenunjangMedis.harga}", style: getDefaultTextStyle())),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text("Hasil Lab", style: getDefaultTextStyle())),
                  TableCell(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFViewerPage(
                              url: item.hasilPenunjang,
                            ),
                          ),
                        );
                      },
                      child: Text("View PDF"),
                    )
                  ),
                ],
              )
            ],
          )
        );
      }),
    ];
  }
}