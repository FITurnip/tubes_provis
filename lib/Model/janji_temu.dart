import 'package:flutter/material.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/theme.dart';

enum StatusJanjiTemu {
  akan_datang,
  sudah_waktunya,
  menunggu_panggilan,
  rawat_jalan,
  selesai,
}

class JanjiTemu {
  Pasien pasien;
  String detail_keluhan;
  bool is_bpjs;
  Dokter dokter;
  DateTime waktu;
  String nomor_tiket;
  StatusJanjiTemu status;
  String qr_code;

  JanjiTemu({
    required this.pasien,
    required this.detail_keluhan,
    required this.is_bpjs,
    required this.dokter,
    required this.waktu,
    required this.nomor_tiket,
    required this.status,
    required this.qr_code,
  });

  factory JanjiTemu.fromJson(Map<String, dynamic> json) {
    return JanjiTemu(
        pasien: Pasien.fromJson(json['pasien']),
        detail_keluhan: '${json['detail_keluhan']}',
        is_bpjs: json['is_bpjs'],
        dokter: Dokter.fromJson(json['dokter']),
        waktu: DateTime.parse(json['tanggal'] + " " + json['jam']),
        nomor_tiket: '${json['nomor_tiket']}',
        qr_code: '${json['qr_code']}',
        status: StatusJanjiTemu.values.firstWhere(
            (element) => element.toString().split('.')[1] == json['status']));
  }

  String getStatus() {
    String status = "";
    switch (this.status) {
      case StatusJanjiTemu.akan_datang:
        status = "Akan Datang";
        break;
      case StatusJanjiTemu.menunggu_panggilan:
        status = "Menunggu Panggilan";
        break;
      case StatusJanjiTemu.rawat_jalan:
        status = "Rawat Jalan";
        break;
      case StatusJanjiTemu.sudah_waktunya:
        status = "Sudah Waktunya";
        break;
      case StatusJanjiTemu.selesai:
        status = "Selesai";
        break;
      default:
    }
    return status;
  }

  Color getStatusColor() {
    final Color color;
    switch (getStatus()) {
      case "Rawat Jalan":
        color = defBlue;
        break;
      case "Akan Datang":
        color = statusGreen;
        break;
      case "Sudah Waktunya":
        color = statusRed;
        break;
      case "Menunggu Panggilan":
        color = basicYellow;
        break;
      case "Selesai":
        color = defBlue;
        break;
      default:
        color = Colors.transparent; // Default color if status is not recognized
        break;
    }
    return color;
  }
}
