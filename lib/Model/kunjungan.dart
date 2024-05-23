class Kunjungan {
  int id;
  int keluhanId;
  String agenda;
  DateTime tanggal;
  String jam;
  String status;
  String? diagnosa;
  String? buktiPembayaran;
  DateTime? tanggalBayar;
  double? totalHarga;

  Kunjungan({
    required this.id,
    required this.keluhanId,
    required this.agenda,
    required this.tanggal,
    required this.jam,
    required this.status,
    this.diagnosa,
    this.buktiPembayaran,
    this.tanggalBayar,
    this.totalHarga,
  });

  factory Kunjungan.fromJson(Map<String, dynamic> json) {
    return Kunjungan(
      id: json['id'],
      keluhanId: json['keluhan_id'],
      agenda: json['agenda'],
      tanggal: DateTime.parse(json['tanggal']),
      jam: json['jam'],
      status: json['status'],
      diagnosa: json['diagnosa'],
      buktiPembayaran: json['bukti_pembayaran'],
      tanggalBayar: json['tanggal_bayar'] != null ? DateTime.parse(json['tanggal_bayar']) : null,
      totalHarga: json['total_harga'] != null ? double.parse(json['total_harga'].toString()) : null,
    );
  }
}
