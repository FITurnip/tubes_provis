import 'package:flutter/material.dart';
import 'package:tubes/Model/pasien.dart';
import 'package:tubes/Widget/store_update_pasien.dart';

class StoreUpdateKeluargaPage extends StatelessWidget {
  final Pasien ?pasien;
  const StoreUpdateKeluargaPage({Key? key, this.pasien}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.of(context).pop();},),
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: StoreUpdatePasien(pasien: pasien, title: "Anggota Keluarga", url: "profile/storeUpdate",),
      ),
    );
  }
}
