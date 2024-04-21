import 'package:tubes/Model/dokter.dart';
import 'package:tubes/Model/ruangan.dart';

class JadwalDokter {
  int _id;
  String _hari;
  String _jam_mulai;
  String _jam_berakhir;
  Ruangan _ruangan;
  Dokter? dokter;

  JadwalDokter(
      this._id, this._hari, this._jam_mulai, this._jam_berakhir, this._ruangan);

  int get id => this._id;

  set id(int value) => this._id = value;

  get hari => this._hari;

  set hari(value) => this._hari = value;

  get jam_mulai => this._jam_mulai;

  set jam_mulai(value) => this._jam_mulai = value;

  get jam_berakhir => this._jam_berakhir;

  set jam_berakhir(value) => this._jam_berakhir = value;

  Ruangan get ruangan => this._ruangan;

  set ruangan(value) => this._ruangan = value;

  get getDokter => this.dokter;

  set setDokter(dokter) => this.dokter = dokter;
}
