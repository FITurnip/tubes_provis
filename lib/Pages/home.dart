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
                    context,
                    'assets/img/Alur.png',
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
                    '11 Makanan untuk Bantu Menurunkan Kolesterol Tinggi',
                    'assets/img/Berita1.png',
                    'Mayo Clinic,Health,Medical News Today',
                    '07/06/2024, 12:00 WIB',
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
            content: const [
              'KOMPAS.com - Beberapa makanan dapat membantu Anda menurunkan kolesterol tinggi dan mencegah penyakit jantung. Memiliki kadar kolesterol tinggi adalah faktor risiko utama penyakit jantung. Merujuk Kementerian Kesehatan RI, Anda memiliki kolesterol tinggi, jika kadarnya berkisar 200-239 mg/dL.',
              'Baca juga: 10 Obat Alami untuk Menurunkan Kolesterol Tinggi yang Perlu Dicoba Ketika kolesterol Anda tinggi, Anda perlu mengatur pola makan untuk menurunkan kadar kolesterol low-density lipoprotein (LDL) yang disebut kolesterol jahat dan meningkatkan kadar high-density lipoprotein (HDL) yang disebut kolesterol baik. Mengonsumsi makanan sehat merupakan garis pertahanan pertama untuk melawan kolesterol tinggi, menurunkan LDL dan meningkatkan HDL.',
              'Baca terus artikel ini selengkapnya untuk mengetahui makanan apa saja yang bisa membantu menurunkan kolesterol tinggi. Baca juga: Kolesterol Tinggi Bisa Mengakibatkan Penyakit Apa? Ini Ulasannya...',
              'Daftar makanan untuk bantu menurunkan kolesterol tinggi Berikut macam makanan yang bisa membantu Anda menurunkan kolesterol tinggi:',
              'Gandum utuh Dikutip dari Health, studi menunjukkan bahwa mengonsumsi gandum utuh secara teratur dapat secara signifikan mengurangi faktor risiko penyakit jantung, termasuk kadar kolesterol total dan LDL yang tinggi. Gandum utuh merupakan sumber terkonsentrasi serat larut yang disebut beta-glukan, yang membantu menurunkan kolesterol dengan mencegah penyerapan kolesterol di saluran pencernaan dan meningkatkan ekskresi kolesterol melalui tinja.',
              'Kacang almond Kacang-kacangan dan biji-bijian merupakan sumber yang kaya serat larut dan dapat membantu menurunkan kadar kolesterol, jika dikonsumsi sebagai bagian dari pola makan bergizi. Almond adalah jenis kacang populer yang secara konsisten dikaitkan dengan manfaat kesehatan jantung, termasuk penurunan kadar kolesterol. Tinjauan pada 2023 terhadap 19 penelitian menemukan bahwa konsumsi kacang-kacangan, termasuk almond, efektif untuk menurunkan kadar kolesterol total, kolesterol LDL, dan trigliserida, yang dapat membantu meningkatkan kesehatan jantung.',
              'Baca juga: Penyakit Apa yang Bisa Menyebabkan Kolesterol Tinggi? Ini Ulasannya...',
              'Kacang kenari Seperti kacang almond, kenari merupakan sumber serat larut yang sangat baik, yang efektif untuk menurunkan kadar kolesterol. Selain serat, kenari mengandung asam lemak tak jenuh ganda (PUFA), termasuk asam α-linoleat, yang mengaktifkan reseptor LDL yang membantu menghilangkan kelebihan LDL dari darah.',
              'Buah beri Buah beri ini merupakan sumber serat yang sangat baik dan nutrisi pelindung jantung lainnya serta senyawa tanaman seperti flavonoid.'
            ],
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

Widget _buildGuideCard(BuildContext context, String imageUrl) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 375,
        height: 150,
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
