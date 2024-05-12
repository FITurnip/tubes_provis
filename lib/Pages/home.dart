import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/Pages/form_keluhan.dart';
import 'package:tubes/Widget/custom_app_bar.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/list_janji.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CustomAppBar(),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: basicYellow,
                  ), // Change this to the icon you want
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            )
          ],
        ),
        body: HomeContent(),
        endDrawer: SafeArea(
            top: true,
            child: Drawer(
              child: Container(
                color: defBlue, // Set the background color of the drawer
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: defBlue,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Drawer Header',
                                        style: getDefaultTextStyle(
                                            font_size: 20.0,
                                            font_color: normalWhite))),
                                IconButton(
                                    icon: Icon(Icons.notifications_rounded,
                                        color: normalWhite),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })
                              ])),
                    ),
                    Card(
                        child: ListTile(
                            onTap: () {},
                            leading: Icon(Icons.calendar_today_outlined,
                                color: normalWhite),
                            trailing: Icon(Icons.more_vert, color: normalWhite),
                            title: Text('10:00' + ' | ' + 'Reservasi',
                                style: getDefaultTextStyle(
                                    font_color: normalWhite,
                                    font_weight: FontWeight.w600)),
                            subtitle: Text(
                                "Silahkan Menunggu Waktu tunggu anda sekitar 10 menit",
                                style: getDefaultTextStyle(
                                    font_color: normalWhite)),
                            tileColor: defBlue,
                            shape: Border(
                                bottom: BorderSide(color: normalWhite)))),
                    Card(
                        child: ListTile(
                            onTap: () {},
                            leading: Icon(Icons.remove_red_eye_outlined,
                                color: normalWhite),
                            trailing: Icon(Icons.more_vert, color: normalWhite),
                            title: Text('11:00' + ' | ' + 'Jadwal Kontrol',
                                style: getDefaultTextStyle(
                                    font_color: normalWhite,
                                    font_weight: FontWeight.w600)),
                            subtitle: Text(
                                "Lihat lebih detail mengenai jadwal kontrol anda",
                                style: getDefaultTextStyle(
                                    font_color: normalWhite)),
                            tileColor: defBlue,
                            shape: Border(
                                bottom: BorderSide(color: normalWhite)))),
                    Card(
                        child: ListTile(
                            onTap: () {},
                            leading: Icon(Icons.money, color: normalWhite),
                            trailing: Icon(Icons.more_vert, color: normalWhite),
                            title: Text('11:15' + ' | ' + 'Administrasi',
                                style: getDefaultTextStyle(
                                    font_color: normalWhite,
                                    font_weight: FontWeight.w600)),
                            subtitle: Text(
                                "Silahkan datang ke ruang administrasi untuk melakukan pembayaran",
                                style: getDefaultTextStyle(
                                    font_color: normalWhite)),
                            tileColor: defBlue,
                            shape: Border(
                                bottom: BorderSide(color: normalWhite)))),
                    Card(
                        child: ListTile(
                            onTap: () {},
                            leading: Icon(Icons.medical_information_outlined,
                                color: normalWhite),
                            trailing: Icon(Icons.more_vert, color: normalWhite),
                            title: Text('10:25' + ' | ' + 'Penunjang Medis',
                                style: getDefaultTextStyle(
                                    font_color: normalWhite,
                                    font_weight: FontWeight.w600)),
                            subtitle: Text(
                                "Silahkan Datang ke Ruang Radiologi LT 1",
                                style: getDefaultTextStyle(
                                    font_color: normalWhite)),
                            tileColor: defBlue,
                            shape: Border(
                                bottom: BorderSide(color: normalWhite)))),
                  ],
                ),
              ),
            )));
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hai, Hafiizh",
            style: getDefaultTextStyle(font_size: 25),
          ),
          Text(
            "Selamat datang kembali di aplikasi SIRAJA!",
            style: getDefaultTextStyle(),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 2 * MediaQuery.of(context).size.width / 5,
                child: Text("Buat janji dengan dokter?",
                    style: getDefaultTextStyle(font_size: 15),
                    overflow: TextOverflow.clip),
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormKeluhan()),
                        )
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
                        "Buat Janji",
                        style: getDefaultTextStyle(font_color: normalWhite),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListJanji(),
          )
        ],
      ),
    );
  }
}
