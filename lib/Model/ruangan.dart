class Ruangan {
  int id;
  String _nama_ruang;
  String _detail;

  Ruangan(this.id, this._nama_ruang, this._detail);
  int get getId => this.id;

  set setId(int id) => this.id = id;
  String get nama_ruang => this._nama_ruang;

  set nama_ruang(String value) => this._nama_ruang = value;

  get detail => this._detail;

  set detail(value) => this._detail = value;
}
