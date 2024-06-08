import 'package:tubes/Pages/Pasien/resep_obat.dart';

class ResepObat {
  int id;
  int detailKunjunganId;
  int obatId;
  int jumlah;
  String keterangan;

  ResepObat({
    required this.id,
    required this.detailKunjunganId,
    required this.obatId,
    required this.jumlah,
    required this.keterangan,
  });

  factory ResepObat.fromJson(Map<String, dynamic> json){
    return ResepObat(
      id: json['id'],
      detailKunjunganId: json['detail_kunjungan_id'],
      obatId: json['obat_id'],
      jumlah: json['jumlah'],
      keterangan: json['keterangan'],
    );
  }
}