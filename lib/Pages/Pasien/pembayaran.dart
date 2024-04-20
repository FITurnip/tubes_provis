import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class Pembayaran extends PasienTemplate {
  Pembayaran()
      : super(title: "Pembayaran", pasienTemplateItems: [], qrData: "") {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
          icon: Icon(Icons.person),
          headerValue: "Pemeriksaan",
          expandedValue: Container(
            child: GestureDetector(
              onTap: () {
                // buat upload gambar
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blackColor,
                      width: 5,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 40,
                        color: blackColor,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Unggah Bukti Pembayaran",
                        style: getDefaultTextStyle(font_color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isExpanded: true),
      ExpansibleItem(
        icon: Icon(Icons.assignment),
        headerValue: "Resep Obat",
        expandedValue: GestureDetector(
          onTap: () {
            // buat upload gambar
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: blackColor,
                  width: 5,
                ),
              ),
              alignment: Alignment.center,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_file,
                    size: 40,
                    color: blackColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Unggah Bukti Pembayaran",
                    style: getDefaultTextStyle(font_color: blackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ExpansibleItem(
          icon: Icon(Icons.summarize),
          headerValue: "Penunjang Medis 1",
          expandedValue: Container(
            child: GestureDetector(
              onTap: () {
                // buat upload gambar
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blackColor,
                      width: 5,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 40,
                        color: blackColor,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Unggah Bukti Pembayaran",
                        style: getDefaultTextStyle(font_color: blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    ];
  }
}
