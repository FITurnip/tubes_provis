import 'package:flutter/material.dart';
import 'package:tubes/Pages/Profile/form_tambah_keluarga.dart';
import 'package:tubes/theme.dart';

class ListKeluarga extends StatefulWidget {
  ListKeluarga();

  @override
  State<ListKeluarga> createState() => _ListKeluargaState();
}

class _ListKeluargaState extends State<ListKeluarga> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back when the button is pressed
            Navigator.of(context).pop();
          },
        ),
        title: Text("Keluarga Terdaftar",
            style: getDefaultTextStyle(font_size: 18.0)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormTambahkeluargaPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: defBlue,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: normalWhite,
                ),
                Text(
                  "Tambah Anggota Keluarga",
                  style: getDefaultTextStyle(font_color: normalWhite),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
            // child:(),
            ),
      ),
    );
  }
}
