import 'package:tubes/Model/janji_temu.dart';
import 'package:tubes/Model/kunjungan.dart';
import 'package:tubes/Pages/Pasien/template.dart';
import 'package:tubes/Widget/expansible_list.dart';
import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class ResepObat extends PasienTemplate {
  // tambah function untuk memisahkan perbagian
  ResepObat({required JanjiTemu janji_temu, required Kunjungan kunjungan}) : super(title: "Hasil Diagnosa", qrData: "", pasienTemplateItems: [], janjiTemu: janji_temu, kunjungan: kunjungan) {
    qrData = "Hello World";
    pasienTemplateItems = [
      ExpansibleItem(
        icon: Icon(Icons.info),
        headerValue: "Informasi Pemesanan",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("No Resep", style: getDefaultTextStyle())),
                TableCell(child: Text("XX-XXX-XXXX", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Tanggal Pemesanan", style: getDefaultTextStyle())),
                TableCell(child: Text("19 April 2024", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Dokter", style: getDefaultTextStyle())),
                TableCell(child: Text("dr. Alfen", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Metode Pembayaran", style: getDefaultTextStyle())),
                TableCell(child: Text("Tunai", style: getDefaultTextStyle())),
              ]
            ),
          ],
        ),
        isExpanded: true
      ),
      ExpansibleItem(
        icon: Icon(Icons.receipt),
        headerValue: "Resep Obat",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Obat", style: getDefaultTextStyle())),
                TableCell(child: Text("Jum.", style: getDefaultTextStyle())),
                TableCell(child: Text("Harga", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2 pcs", style: getDefaultTextStyle())),
                TableCell(child: Text("Rp. 150.000,00", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2 pcs", style: getDefaultTextStyle())),
                TableCell(child: Text("Rp. 150.000,00", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("", style: getDefaultTextStyle())),
                TableCell(child: Text("Subtotal", style: getDefaultTextStyle())),
                TableCell(child: Text("Rp. 150.000,00", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("", style: getDefaultTextStyle())),
                TableCell(child: Text("BPJS", style: getDefaultTextStyle())),
                TableCell(child: Text("Rp. 150.000,00", style: getDefaultTextStyle())),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Text("", style: getDefaultTextStyle())),
                TableCell(child: Text("Total", style: getDefaultTextStyle())),
                TableCell(child: Text("Rp. 150.000,00", style: getDefaultTextStyle())),
              ],
            ),
          ],
        )
      ),
      ExpansibleItem(
        icon: Icon(Icons.rule),
        headerValue: "Aturan Penggunaan Obat",
        expandedValue: Table(
          children: [
            TableRow(
              children: [
                TableCell(child: Text("Obat", style: getDefaultTextStyle())),
                TableCell(child: Text("Aturan", style: getDefaultTextStyle())),
                TableCell(child: Text("Takaran", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2xSehari", style: getDefaultTextStyle())),
                TableCell(child: Text("Tetes", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2xSehari", style: getDefaultTextStyle())),
                TableCell(child: Text("Tetes", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2xSehari", style: getDefaultTextStyle())),
                TableCell(child: Text("Tetes", style: getDefaultTextStyle())),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Text("Betadine", style: getDefaultTextStyle())),
                TableCell(child: Text("2xSehari", style: getDefaultTextStyle())),
                TableCell(child: Text("Tetes", style: getDefaultTextStyle())),
              ]
            ),
          ],
        ),
        isExpanded: true
      ),
    ];
  }
}