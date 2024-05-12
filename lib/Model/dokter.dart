import 'package:tubes/Model/jadwal_dokter.dart';

class Dokter {
  int id;
  String foto;
  String nama_dokter;
  String jenkel;
  DateTime tglLahir;
  String bidang;
  JadwalDokter? jadwal;

  Dokter(
      {required this.id,
      required this.nama_dokter,
      required this.bidang,
      required this.foto,
      required this.jenkel,
      required this.tglLahir});

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
        id: json['id'],
        foto: '${json['foto']}',
        nama_dokter: '${json['nama_dokter']}',
        jenkel: '${json['jenkel']}',
        tglLahir: DateTime.parse(json['tgl_lahir']),
        bidang: json['bidang']['bidang']);
  }
}
