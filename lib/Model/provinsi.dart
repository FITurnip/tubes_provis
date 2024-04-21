class Provinsi {
  int uidProvinsi;
  int kodeProvinsi;
  String nama;

  Provinsi({
    required this.uidProvinsi,
    required this.kodeProvinsi,
    required this.nama,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      uidProvinsi: int.parse(json['uid_provinsi'].toString()),
      kodeProvinsi: int.parse(json['kode_provinsi'].toString()),
      nama: json['nama'],
    );
  }
}
