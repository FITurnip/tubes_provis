class Dokter {
  String _nama;
  String? _foto;
  String? get foto => this._foto;

  set foto(String? value) => this._foto = value;
  String _bidang;

  get bidang => this._bidang;

  set bidang(value) => this._bidang = value;
  Dokter(this._nama, this._bidang, this._foto);

  String get nama => this._nama;

  set nama(String value) => this._nama = value;
}
