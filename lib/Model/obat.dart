class Obat {
  int id;
  String namaObat;
  double harga;
  String? deskripsi;
  int stok;

  Obat({
    required this.id,
    required this.namaObat,
    required this.harga,
    this.deskripsi,
    required this.stok,
  });

  factory Obat.fromJson(Map<String, dynamic> json) {
    return Obat(
      id: json['id'],
      namaObat: json['nama_obat'],
      harga: double.parse(json['harga'].toString()),
      deskripsi: json['deskripsi'],
      stok: json['stok'],
    );
  }
}
