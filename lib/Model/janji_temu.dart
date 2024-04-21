import 'package:flutter/material.dart';
import 'package:tubes/Model/dokter.dart';

enum StatusJanjiTemu {
  akan_datang,
  sudah_waktunya,
  menunggu_panggilan,
  rawat_jalan,
  selesai,
}

class JanjiTemu {
  List<String> _tag_keluhan;
  DateTime _waktu;
  Dokter _dokter;
  StatusJanjiTemu _status;
  JanjiTemu(
    List<String> this._tag_keluhan,
    DateTime this._waktu,
    Dokter this._dokter,
    StatusJanjiTemu this._status,
  );
  List<String> get tag_keluhan => this._tag_keluhan;

  set tag_keluhan(List<String> value) => this._tag_keluhan = value;

  DateTime get waktu => this._waktu;

  set waktu(DateTime value) => this._waktu = value;

  Dokter get dokter => this._dokter;

  set dokter(Dokter value) => this._dokter = value;

  String getStatus() {
    String status = "";
    switch (this._status) {
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

  set status(value) => this._status = value;
}

var janjiTemuList = [
  JanjiTemu(
      ["#mual", "#pusing"],
      DateTime.parse('2024-01-21 15:00:00'),
      Dokter("Dr Fya Agustin", "Poli Umum", "assets/img/dokter/dokter1.jpg",
          "Perempuan", DateTime.parse("1990-11-02")),
      StatusJanjiTemu.akan_datang),
  JanjiTemu(
      ["#nyeri_lambung", "#pusing"],
      DateTime.parse('2024-02-01 08:15:00'),
      Dokter("Dr Wijaya", "Poli Umum", "assets/img/dokter/dokter2.jpg",
          "Laki-laki", DateTime.parse("1990-11-02")),
      StatusJanjiTemu.selesai),
  JanjiTemu(
      ["#nyeri_sendi"],
      DateTime.parse('2024-03-02 11:00:00'),
      Dokter("Dr Reni Ransyiah", "Poli Umum", "assets/img/dokter/dokter3.jpg",
          "Perempuan", DateTime.parse("1990-11-02")),
      StatusJanjiTemu.rawat_jalan),
  JanjiTemu(
      ["#vertigo", "#demam"],
      DateTime.parse('2024-01-08 09:45:00'),
      Dokter("Dr Jayanti Putri", "Poli Umum", "assets/img/dokter/dokter4.jpg",
          "Perempuan", DateTime.parse("1990-11-02")),
      StatusJanjiTemu.sudah_waktunya),
];
