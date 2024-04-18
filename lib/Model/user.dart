import 'package:tubes/Model/pasien.dart';

class User {
  String _nama = '';
  String _email = '';
  String _role = '';
  Pasien _detailPasien = new Pasien();

  User(nama, email, role, Pasien detailPasien) {
    this._nama = nama;
    this._email = email;
    this._role = role;
    this._detailPasien = detailPasien;
  }
  String get nama => this._nama;

  set nama(String value) => this._nama = value;

  get email => this._email;

  set email(value) => this._email = value;

  get role => this._role;

  set role(value) => this._role = value;
}
