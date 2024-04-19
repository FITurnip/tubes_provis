import 'package:tubes/Model/pasien.dart';

class User {
  int _id;
  String _token;
  String _nama;
  String _email;
  String _role;
  Pasien _detailPasien;
  List<Pasien>? _anggotaKeluarga;

  User(this._id, this._nama, this._email, this._role, this._detailPasien,
      this._token);

  int get id => this._id;

  set id(int value) => this._id = value;

  String get getToken => this._token;

  set setToken(String token) => this._token = token;

  String get nama => this._nama;

  set nama(String value) => this._nama = value;

  get email => this._email;

  set email(value) => this._email = value;

  get role => this._role;

  set role(value) => this._role = value;

  Pasien get detailPasien => this._detailPasien;

  set detailPasien(Pasien value) => this._detailPasien = value;

  List<Pasien>? get anggotaKeluarga => this._anggotaKeluarga;

  set anggotaKeluarga(List<Pasien>? value) => this._anggotaKeluarga = value;
}
