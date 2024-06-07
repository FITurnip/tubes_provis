import 'package:flutter/material.dart';
import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/jadwal_dokter.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Model/ruangan.dart';
import 'package:tubes/theme.dart';

enum StatusJanjiTemu {
  akan_datang,
  sudah_waktunya,
  kadaluarsa,
  menunggu_panggilan,
  masuk_ruangan,
  belum_bayar,
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
  int id;

  JanjiTemu({
    required this.pasien,
    required this.detail_keluhan,
    required this.is_bpjs,
    required this.dokter,
    required this.waktu,
    required this.nomor_tiket,
    required this.status,
    required this.qr_code,
    required this.id,
  });
  //bad state no element error di status nya
  factory JanjiTemu.fromJson(Map<String, dynamic> json) {
    Dokter tempDokter = Dokter.fromJson(json['dokter']);
    dynamic jadwal = json['jadwal'];
    Ruangan tempRuang = new Ruangan(
        jadwal['ruangan']['id'],
        '${jadwal['ruangan']['nama_ruang']}',
        '${jadwal['ruangan']['detail_ruang']}');
    JadwalDokter tempJadwal = new JadwalDokter(jadwal['id'], jadwal['hari'],
        jadwal['jam_mulai'], jadwal['jam_berakhir'], tempRuang);
    tempDokter.jadwal = tempJadwal;
    return JanjiTemu(
        id: json['id'],
        pasien: Pasien.fromJson(json['pasien']),
        detail_keluhan: '${json['detail_keluhan']}',
        is_bpjs: json['is_bpjs'],
        dokter: tempDokter,
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
      case StatusJanjiTemu.kadaluarsa:
        status = "Kadaluarsa";
      case StatusJanjiTemu.menunggu_panggilan:
        status = "Menunggu Panggilan";
        break;
      case StatusJanjiTemu.masuk_ruangan:
        status = "Masuk Ruangan";
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
      case "Akan Datang":
        color = statusGreen;
        break;
      case "Kadaluarsa":
        color = statusRed;
        break;
      case "Sudah Waktunya":
        color = basicYellow;
        break;
      case "Menunggu Panggilan":
        color = statusBlue;
        break;
      case "Masuk Ruangan":
        color = statusMagenta;
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
