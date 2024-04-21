class Kota {
  int uidKota;
  int uidProvinsi;
  int kodeKota;
  String namaKota;

  Kota({
    required this.uidKota,
    required this.uidProvinsi,
    required this.kodeKota,
    required this.namaKota,
  });

  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
      uidKota: int.parse(json['uid_kota'].toString()),
      uidProvinsi: int.parse(json['provinsi_uid'].toString()),
      kodeKota: int.parse(json['kode_kota'].toString()),
      namaKota: json['nama'],
    );
  }
}
