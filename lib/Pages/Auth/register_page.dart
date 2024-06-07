import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes/Widget/store_update_pasien.dart';
import 'package:tubes/Model/provinsi.dart';
import 'package:tubes/Model/kota.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.of(context).pop();},),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child:
        StoreUpdatePasien(title: "Registrasi", url: "register", withEmail: true, withPassword: true,),
      ),
    );
  }
}