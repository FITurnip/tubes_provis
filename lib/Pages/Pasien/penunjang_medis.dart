import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/FileViewer/image_viewer.dart';
import 'package:tubes/Pages/FileViewer/pdf_viewer.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:intl/intl.dart';

class PenunjangMedis extends PasienTemplate {
  PenunjangMedis(BuildContext context,
      {required JanjiTemu janji_temu, required Kunjungan kunjungan})
      : super(
            title: "Penunjang Medis",
            pasienTemplateItems: [],
            qrData: "",
            janjiTemu: janji_temu,
            kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ...kunjungan.penunjangMedis.map((item) {
        // print(item.masterPenunjangMedis)
        return ExpansibleItem(
            headerValue: item.masterPenunjangMedis.jenisPenunjangMedis,
            expandedValue: Table(
              children: [
                TableRow(
                  children: [
                    TableCell(
                        child: Text("Harga", style: getDefaultTextStyle())),
                    TableCell(
                        child: Text(
                            formatCurrency(item.masterPenunjangMedis.harga),
                            style: getDefaultTextStyle())),
                  ],
                ),
                if (item.hasilPenunjang != "Menunggu")
                  TableRow(
                    children: [
                      TableCell(
                          child:
                              Text("Hasil Lab", style: getDefaultTextStyle())),
                      TableCell(
                        child: Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: ElevatedButton(
                              onPressed: () {
                                print("file extension:");
                                print(getFileExtension(item.hasilPenunjang));
                                if (getFileExtension(item.hasilPenunjang) ==
                                    "pdf") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PDFViewerPage(
                                        url: item.hasilPenunjang,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageViewerPage(
                                        url: item.hasilPenunjang,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: defBlue,
                              ),
                              child: Text(
                                "Lihat",
                                style: getDefaultTextStyle(
                                    font_color: normalWhite),
                              ),
                            )),
                      )
                    ],
                  )
              ],
            ));
      }),
    ];
  }

  String? getFileExtension(String url) {
    try {
      Uri uri = Uri.parse(url);
      String path = uri.path;
      int dotIndex = path.lastIndexOf('.');
      if (dotIndex != -1 && dotIndex != path.length - 1) {
        return path.substring(dotIndex + 1);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  String formatCurrency(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return currencyFormatter.format(amount);
  }
}
