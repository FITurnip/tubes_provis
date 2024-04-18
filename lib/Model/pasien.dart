import 'package:intl/intl.dart';

class Pasien {
  int _id_profile;
  String _nik;
  String _name;
  String _jenkel;
  dynamic _tgl_lahir;
  String _tempat_lahir;
  String _no_telp;
  String? _status;
  bool _is_default;
  String? _foto;
  String? _file_bpjs;
  String get nik => this._nik;

  int get id_profile => this._id_profile;

  set id_profile(int value) => this._id_profile = value;

  set nik(String value) => this._nik = value;

  get name => this._name;

  set name(value) => this._name = value;

  get jenkel => this._jenkel;

  set jenkel(value) => this._jenkel = value;

  get tgl_lahir => this._tgl_lahir;

  set tgl_lahir(value) => this._tgl_lahir = value;

  get tempat_lahir => this._tempat_lahir;

  set tempat_lahir(value) => this._tempat_lahir = value;

  get no_telp => this._no_telp;

  set no_telp(value) => this._no_telp = value;

  get status => this._status;

  set status(value) => this._status = value;

  get is_default => this._is_default;

  set is_default(value) => this._is_default = value;

  get foto => this._foto;

  set foto(value) => this._foto = value;

  get file_bpjs => this._file_bpjs;

  set file_bpjs(value) => this._file_bpjs = value;
  Pasien(
      this._id_profile,
      this._nik,
      this._name,
      this._jenkel,
      this._tgl_lahir,
      this._tempat_lahir,
      this._no_telp,
      this._status,
      this._is_default,
      this._foto,
      this._file_bpjs);
}
