import 'package:flutter/material.dart';
import 'package:tubes/Pages/Profile/form_tambah_keluarga.dart';
import 'package:tubes/theme.dart';

class ListKeluarga extends StatefulWidget {
  ListKeluarga();

  @override
  State<ListKeluarga> createState() => _ListKeluargaState();
}

class _ListKeluargaState extends State<ListKeluarga> {
  final List<Map<String, String>> keluarga = [
    {"name": "Jajang Saepulloh", "image": "assets/img/photo_profile.png"},
    {"name": "Jajang Saepulloh", "image": "assets/img/photo_profile.png"},
    {"name": "Jajang Saepulloh", "image": "assets/img/photo_profile.png"},
    // Tambahkan anggota keluarga lainnya di sini
  ];

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
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: keluarga.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: normalWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 110,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          keluarga[index]["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  keluarga[index]["name"]!,
                                  style: getDefaultTextStyle(
                                      font_size: 12,
                                      font_weight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit,
                                          color: Colors.white, size: 16),
                                      label: Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        minimumSize: Size(70, 36),
                                        textStyle: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete,
                                          color: Colors.white, size: 16),
                                      label: Text(
                                        "Hapus",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 1),
                                        minimumSize: Size(70, 36),
                                        textStyle: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
