class PenunjangMedis {
  int id;
  int detailKunjunganId;
  int penunjangId;
  String hasilPenunjang;
  MasterPenunjangMedis masterPenunjangMedis;

  PenunjangMedis({
    required this.id,
    required this.detailKunjunganId,
    required this.penunjangId,
    required this.hasilPenunjang,
    required this.masterPenunjangMedis,
  });

  factory PenunjangMedis.fromJson(Map<String, dynamic> json) {
    return PenunjangMedis(
      id: json['id'],
      detailKunjunganId: json['detail_kunjungan_id'],
      penunjangId: json['penunjang_id'],
      hasilPenunjang: json['hasil_penunjang'],
      masterPenunjangMedis: MasterPenunjangMedis.fromJson(json['master_penunjang_medis']),
    );
  }
}

class MasterPenunjangMedis {
  int id;
  String jenisPenunjangMedis;
  double harga;

  MasterPenunjangMedis({
    required this.id,
    required this.jenisPenunjangMedis,
    required this.harga,
  });

  factory MasterPenunjangMedis.fromJson(Map<String, dynamic> json) {
    return MasterPenunjangMedis(
      id: json['id'],
      jenisPenunjangMedis: json['jenis_penunjang_medis'],
      harga: double.parse(json['harga'].toString()),
    );
  }
}
