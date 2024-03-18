class MainAppModel {
  String _nama;
  MainAppModel(this._nama);

  void setNama(String nama) {
    _nama = nama;
  }

  String getNama() {
    return _nama;
  }
}