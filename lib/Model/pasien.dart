class Pasien {
  int id_profile;
  String nik;
  String name;
  String jenkel;
  DateTime tgl_lahir;
  int id_tempat_lahir;
  String no_telp;
  String? status;
  bool is_default;
  String? foto;
  String? file_bpjs;

  Pasien(
      {required this.id_profile,
      required this.nik,
      required this.name,
      required this.jenkel,
      required this.tgl_lahir,
      required this.id_tempat_lahir,
      required this.no_telp,
      required this.status,
      required this.is_default,
      required this.foto,
      required this.file_bpjs});

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
        id_profile: json['id'],
        nik: '${json['nik']}',
        name: '${json['name']}',
        jenkel: '${json['jenkel']}',
        tgl_lahir: DateTime.parse(json['tgl_lahir']),
        id_tempat_lahir: int.parse(json['tempat_lahir']),
        no_telp: '${json['no_telp']}',
        status: '${json['status']}',
        is_default: json['is_default'],
        foto: '${json['foto']}',
        file_bpjs: '${json['file_bpjs']}');
  }
}
