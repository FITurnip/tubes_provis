import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/Pages/detail_berita.dart';
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
                ),
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
            color: defBlue,
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
                          child: Text(
                            'Drawer Header',
                            style: getDefaultTextStyle(
                              font_size: 20.0,
                              font_color: normalWhite,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications_rounded,
                            color: normalWhite,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildDrawerItem(
                        icon: Icons.calendar_today_outlined,
                        title: '10:00 | Reservasi',
                        subtitle:
                            'Silahkan Menunggu Waktu tunggu anda sekitar 10 menit',
                      ),
                      _buildDrawerItem(
                        icon: Icons.remove_red_eye_outlined,
                        title: '11:00 | Jadwal Kontrol',
                        subtitle:
                            'Lihat lebih detail mengenai jadwal kontrol anda',
                      ),
                      _buildDrawerItem(
                        icon: Icons.money,
                        title: '11:15 | Administrasi',
                        subtitle:
                            'Silahkan datang ke ruang administrasi untuk melakukan pembayaran',
                      ),
                      _buildDrawerItem(
                        icon: Icons.medical_information_outlined,
                        title: '10:25 | Penunjang Medis',
                        subtitle: 'Silahkan Datang ke Ruang Radiologi LT 1',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Icon(icon, color: normalWhite),
        trailing: Icon(Icons.more_vert, color: normalWhite),
        title: Text(
          title,
          style: getDefaultTextStyle(
            font_color: normalWhite,
            font_weight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: getDefaultTextStyle(font_color: normalWhite),
        ),
        tileColor: defBlue,
        shape: Border(bottom: BorderSide(color: normalWhite)),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            Text(
              "Hai, Hafiizh",
              style: getDefaultTextStyle(font_size: 25),
            ),
            SizedBox(height: 15),
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
                  child: Text(
                    "Buat janji dengan dokter?",
                    style: getDefaultTextStyle(font_size: 15),
                    overflow: TextOverflow.clip,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormKeluhan()),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Panduan",
              style: getDefaultTextStyle(
                  font_size: 20, font_weight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildGuideCard(
                    'assets/img/Logo.png',
                  ),
                  // Tambahkan lebih banyak kartu panduan jika diperlukan
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Berita - Berita Terbaru",
              style: getDefaultTextStyle(
                  font_size: 20, font_weight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildNewsCard(
                    context,
                    'Kapan Waktu yang Tepat untuk Minum Air Rebusan Serai?',
                    'assets/img/bpjs.png',
                    'Healthline, India Times, Tua Saude',
                    '23/05/2024, 07.30 WIB',
                    'Kompas',
                  ),
                  _buildNewsCard(
                    context,
                    'Kapan Waktu yang Tepat untuk Minum Air Rebusan Serai?',
                    'assets/img/bpjs.png',
                    'Healthline, India Times, Tua Saude',
                    '23/05/2024, 07.30 WIB',
                    'Kompas',
                  ),
                  _buildNewsCard(
                    context,
                    'Kapan Waktu yang Tepat untuk Minum Air Rebusan Serai?',
                    'assets/img/bpjs.png',
                    'Healthline, India Times, Tua Saude',
                    '23/05/2024, 07.30 WIB',
                    'Kompas',
                  ),
                  _buildNewsCard(
                    context,
                    'Kapan Waktu yang Tepat untuk Minum Air Rebusan Serai?',
                    'assets/img/bpjs.png',
                    'Healthline, India Times, Tua Saude',
                    '23/05/2024, 07.30 WIB',
                    'Kompas',
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "List Janji",
              style: getDefaultTextStyle(
                  font_size: 20, font_weight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              height: 400,
              child: ListJanji(),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

Widget _buildNewsCard(BuildContext context, String title, String imageUrl,
    String sumber, String tanggal, String penerbit) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailBerita(
            title: title,
            imageUrl: imageUrl,
            sumber: sumber,
            tanggal: tanggal,
            penerbit: penerbit,
            content:
                'KOMPAS.com - Air rebusan serai terkenal sebagai minuman alami yang dapat menyehatkan tubuh. Lantas, kapan waktu yang tepat untuk minum air rebusan serai? Ternyata, air rebusan serai dapat diminum pada pagi dan malam hari demi meningkatkan kesehatan. Sebelum mengetahui waktu yang tepat untuk minum air rebusan serai, simak dahulu manfaat minuman herbal ini.',
          ),
        ),
      );
    },
    child: Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 350,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: getDefaultTextStyle(
                        font_size: 16,
                        font_weight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Sumber: ",
                          style: getDefaultTextStyle(font_size: 14),
                        ),
                        Expanded(
                          child: Text(
                            sumber,
                            style: getDefaultTextStyle(
                                font_size: 14, font_weight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildGuideCard(String imageUrl) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: 375,
      height: 150,
      child: InkWell(
        onTap: () {
          // Tambahkan fungsi yang akan dipanggil ketika kartu panduan ditekan
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
        ),
      ),
    ),
  );
}
