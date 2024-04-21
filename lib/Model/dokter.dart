import 'package:tubes/Model/JadwalDokter.dart';

class Dokter {
  String _nama;
  String _foto;
  String _bidang;
  DateTime _tglLahir;
  String _jenkel;
  JadwalDokter? _jadwal;
  JadwalDokter? get jadwal => this._jadwal;

  set jadwal(JadwalDokter? value) => this._jadwal = value;

  String get nama => this._nama;

  set nama(String value) => this._nama = value;

  get foto => this._foto;

  set foto(value) => this._foto = value;

  get bidang => this._bidang;

  set bidang(value) => this._bidang = value;

  get tglLahir => this._tglLahir;

  set tglLahir(value) => this._tglLahir = value;

  get jenkel => this._jenkel;

  set jenkel(value) => this._jenkel = value;

  Dokter(this._nama, this._bidang, this._foto, this._jenkel, this._tglLahir);
}
