import 'package:flutter/src/material/list_tile.dart';
class Keluhan {
  int id;
  DateTime? tanggal; 
  double tarifKonsultasi;
  String hari;

  Keluhan({
    required this.id,
    this.tanggal, 
    // required this.dokter,
    required this.tarifKonsultasi,
    required this.hari,
  });

  factory Keluhan.fromJson(Map<String, dynamic> json) {
    return Keluhan(
      id: json['id'],
      tanggal: json['tanggal'] != null ? DateTime.parse(json['tanggal']) : null,
      tarifKonsultasi: double.parse(json['tarif_konsultasi']),
      hari: json['hari'],
    );
  }

  get isEmpty => null;

  map(ListTile Function(dynamic konsultasi) param0) {}
}
