import 'package:tubes/Model/obat.dart';

class ResepObat {
  int id;
  int detailKunjunganId;
  int obatId;
  int jumlah;
  String keterangan;
  Obat masterObat;

  ResepObat({
    required this.id,
    required this.detailKunjunganId,
    required this.obatId,
    required this.jumlah,
    required this.keterangan,
    required this.masterObat,
  });

  factory ResepObat.fromJson(Map<String, dynamic> json) {
    return ResepObat(
      id: json['id'],
      detailKunjunganId: json['detail_kunjungan_id'],
      obatId: json['obat_id'],
      jumlah: json['jumlah'],
      keterangan: json['keterangan'],
      masterObat: Obat.fromJson(json['master_obat']),
    );
  }
}
