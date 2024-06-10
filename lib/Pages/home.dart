import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes/Controller/janji_temu_controller.dart';
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

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isLoading = false;

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              color: normalWhite,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(defBlue),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Loading...",
                    style: getDefaultTextStyle(font_color: blackColor, font_size: 15),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
                  _buildNewsCard1(
                    context,
                    '11 Makanan untuk Bantu Menurunkan Kolesterol Tinggi',
                    'assets/img/Berita1.png',
                    'Mayo Clinic,Health,Medical News Today',
                    '07/06/2024, 12:00 WIB',
                    'Kompas',
                  ),
                  _buildNewsCard2(
                    context,
                    '10 Obat Alami untuk Menurunkan Kolesterol Tinggi yang Perlu Dicoba',
                    'assets/img/Berita2.png',
                    'Healthline,Hindustan Times',
                    '04/06/2024, 19:00 WIB',
                    'Kompas',
                  ),
                  _buildNewsCard3(
                    context,
                    '8 Cara Mudah Menjaga Kesehatan Ginjal, Biar Tak Harus Cuci Darah di Usia 20-an',
                    'assets/img/Berita3.png',
                    'Healthline,Hindustan Times',
                    '08/06/2024, 08:58 WIB',
                    'detikHealth',
                  ),
                  _buildNewsCard4(
                    context,
                    'WHO dan Kementerian Kesehatan Menyerukan Eliminasi Lemak Trans untuk Indonesia Lebih Sehat dan Produktif',
                    'assets/img/Berita4.png',
                    'Joint News Release',
                    '06/05/2024',
                    'WHO',
                  ),
                  _buildNewsCard5(
                    context,
                    'WHO Mendorong Legislasi yang Berani dan Tegas untuk Melindungi Generasi Muda dari Pengaruh Industri Tembakau',
                    'assets/img/Berita5.png',
                    'Media release',
                    '30/05/2024, 08:58 WIB',
                    'WHO',
                  ),
                ],
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "List Janji",
                  style: getDefaultTextStyle(
                      font_size: 20, font_weight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    _showLoadingDialog(context);
                    await Provider.of<JanjiTemuControlProvider>(context,
                            listen: false)
                        .fetchJanjiTemu(isRiwayat: false);
                    Navigator.pop(context); 
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 400,
              child: ListJanji(isRiwayat: false),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}


Widget _buildNewsCard1(BuildContext context, String title, String imageUrl,
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

Widget _buildNewsCard2(BuildContext context, String title, String imageUrl,
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
              'KOMPAS.com - Sejumlah herbal atau makanan nabati dapat Anda manfaatkan untuk membantu Anda menurunkan kolesterol tinggi. Mengutip Hindustan Times, kolesterol tinggi seiring waktu dapat merusak kesehatan Anda secara keseluruhan dan membuat Anda rentan mengalami berbagai penyakit kronis. Baca juga: Kolesterol Tinggi Bisa Mengakibatkan Penyakit Apa? Ini Ulasannya...',
              'Kolesterol berlebih akan menumpuk dan membentuk plak di dinding arteri, sehingga membuat Anda berisiko terkena serangan jantung dan banyak penyakit kronis, seperti stroke, diabetes, dan tekanan darah tinggi. Namun, penting diketahui bahwa kolesterol ada yang bersifat jahat (low-density lipoprotein/LDL) dan baik (high-density lipoprotein/HDL). Untuk mengetahui cara mengurangi kolesterol tinggi dan mencegah komplikasinya dengan obat alami, baca artikel ini selengkapnya. Baca juga: Penyakit Apa yang Bisa Menyebabkan Kolesterol Tinggi? Ini Ulasannya...',
              'Apa obat alami untuk menurunkan kolesterol tinggi? Berikut macam tanaman herbal maupun makanan nabati yang bisa Anda manfaatkan sebagai obat untuk menurunkan kolesterol tinggi secara alami:',
              'Kunyit Kunyit mengandung senyawa aktif yang dikenal sebagai kurkumin. Senyawa ini mampu membantu menurunkan kadar kolesterol tinggi, khususnya LDL. Karena memiliki sifat antioksidan dan anti-inflamasi, senyawa aktif kunyit ini efektif dalam mengurangi risiko gangguan kesehatan, seperti penyakit radang paru-paru kronis, pankreatitis, masalah usus, dan penyakit jantung.',
              'Kayu manis Kayu manis bermanfaat untuk mendukung produksi insulin dalam tubuh dan membantu mengurangi kolesterol darah. Selain itu, rempah ini membantu melancarkan aliran darah dan menjaga tubuh bersih dari penyumbatan internal. Oleh karenanya, kayu manis dikenal sebagai rempah yang sangat baik untuk menjaga kesehatan jantung. Baca juga: 10 Makanan yang Baik dan Buruk Saat Kolesterol Tinggi',
              'Lada hitam Lada hitam bermanfaat sebagai obat alami untuk menurunkan kolesterol tinggi karena dapat membantu memecah sel-sel lemak. Selain itu, bahan aktif piperine memiliki efek antioksidan dan antibakteri yang signifikan membantu pencernaan, infeksi paru-paru, batuk, dan pilek.',
              'Fenugreek Fenugreek adalah salah satu rempah yang banyak digunakan untuk mengendalikan kolesterol.',
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

Widget _buildNewsCard3(BuildContext context, String title, String imageUrl,
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
              'Jakarta - Ginjal merupakan organ yang memiliki besar seperti kepalan tangan yang memiliki banyak peranan penting bagi tubuh. Manfaatnya membantu menyaring racun, limbah, air, dan mineral berlebih pada tubuh yang dikeluarkan melalui urine. Selain itu, ginjal juga memproduksi hormon yang dapat mengatur tekanan darah serta mengontrol produksi sel darah merah. Maka penting untuk selalu menjaga kesehatan ginjal dengan mempertahankan gaya hidup sehat agar terhindar dari risiko terkena penyakit ginjal.',
              'Berikut delapan tips yang dapat dilakukan untuk menjaga ginjal tetap sehat agar tetap berfungsi dengan baik:',
              '1. Olahraga\nTernyata, berolahraga dapat membantu menurunkan tekanan darah serta menjaga kesehatan jantung. Tak harus berolahraga berat, berjalan kaki dan bersepeda juga dapat menurunkan risiko terjadinya penyakit ginjal kronis.',
              '2. Kelola Kadar Gula Darah\nPenting untuk selalu mengelola gula darah agar terhindar dari penyakit diabetes ataupun kondisi yang menyebabkan tingginya kadar gula darah. Kondisi ini dapat merusak ginjal karena tubuh tidak dapat menggunakan glukosa dalam darah sehingga ginjal dipaksa bekerja untuk menyaring darah dalam tubuh.',
              '3. Jaga Tekanan Darah\nSelain mengelola kadar gula darah, menjaga tekanan darah agar tetap stabil juga dapat mengurangi risiko penyakit ginjal. Angka tekanan darah yang sehat berada di angka 120/80. Apabila tekanan darah berada diatas 140/90, segera temui dokter dan terapkan pola hidup sehat karena kondisi ini mungkin menandakan penyakit hipertensi atau tekanan darah tinggi yang meningkatkan risiko penyakit ginjal.',
              '4. Jaga Berat Badan\nOrang dengan kelebihan berat badan atau obesitas tentunya lebih berisiko untuk mengalami berbagai macam penyakit termasuk masalah ginjal. Lakukan diet seimbang yang rendah natrium dan daging olahan. Beberapa makanan yang disarankan seperti mengonsumsi kembang kol, bluberi, ikan, biji-bijian dan lainnya untuk membantu mengurangi risiko kerusakan ginjal.',
              '5. Minum Air Putih yang Cukup\nMinum air putih delapan gelas atau setidaknya 1,5 hingga 2 liter sehari dapat menjaga tubuh agar tetap terhidrasi. Konsumsi air yang cukup dapat membantu membersihkan natrium dan racun dari ginjal agar menurunkan risiko penyakit ginjal kronis.',
              '6. Hindari Rokok\nMerokok dapat merusak pembuluh darah yang menyebabkan produksi darah menjadi lebih lambat ke seluruh organ termasuk ginjal. Situasi tersebut dapat membuat ginjal mengalami kerusakan bahkan berpotensi terjadinya kanker ginjal.',
              '7. Batasi Obat Pereda Nyeri\nTerlalu sering mengonsumsi obat pereda nyeri termasuk ibuprofen dan naproxen dapat meningkatkan risiko kerusakan ginjal karena membuat ginjal bekerja lebih berat. National Kidney Foundation juga mengatakan bahwa obat pereda nyeri tidak boleh diminum lebih dari 10 hari. Jika diminum sesekali mungkin tidak masalah, tetapi jika dikonsumsi terus menerus tentunya memiliki risiko terhadap kesehatan ginjal.',
              '8. Periksa Ginjal Secara Rutin Apabila Mengalami Risiko Tinggi\nTerdapat kondisi seseorang yang memiliki risiko terkena penyakit ginjal lebih tinggi sehingga disarankan untuk melakukan pemeriksaan rutin antara lain:',
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

Widget _buildNewsCard4(BuildContext context, String title, String imageUrl,
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
              'Organisasi Kesehatan Dunia (WHO) hari ini meluncurkan kajian perintis mengenai sumber makanan asam lemak trans dalam pasokan pangan Indonesia. Peluncuran ini bertujuan mendukung penerbitan peraturan pemerintah untuk mengeliminasi lemak trans. ',
              'Lemak trans atau asam lemak trans adalah asam lemak tak jenuh yang berasal dari sumber alami atau industri. Konsumsi lemak trans secara signifikan dapat meningkatkan risiko serangan jantung dan berkontribusi terhadap sekitar 500.000 kematian akibat penyakit jantung koroner secara global setiap tahunnya.',
              'Studi dasar ini melibatkan pengujian laboratorium terhadap 130 produk di empat kategori makanan: minyak dan lemak, margarin dan olesan, makanan kemasan yang terbuat dari lemak (seperti biskuit, kue kering, wafer, kue, dan roti), serta makanan siap saji seperti mi goreng, nasi goreng, ayam goreng, kentang goreng, dan roti.',
              'WHO merekomendasikan kadar lemak trans dalam pangan kurang dari 2 gram per 100 gram total lemak. Namun, hampir 10% produk yang disurvei atau sekitar 11 makanan mengandung kadar lemak trans melebihi rekomendasi tersebut. ',
              'Kadar lemak trans yang tinggi juga terdapat pada produk makanan ringan yang populer dan banyak dikonsumsi, seperti biskuit, wafer, produk roti, dan jajanan kaki lima seperti martabak. Konsentrasi lemak trans tertinggi terdapat pada campuran margarin dan mentega, yaitu 10 kali lebih tinggi dari batas yang direkomendasikan WHO.',
              '“Di Indonesia harus diakui masih kekurangan data terkait lemak trans pada pangan. Kemenkes sangat mengapresiasi upaya dari WHO Indonesia untuk melakukan kajian kandungan lemak trans pada makanan,” kata Wakil Menteri Kesehatan RI, Prof. Dante Saksono Harbuwono dalam acara tingkat tinggi di Jakarta, Senin (6/5).',
              'Wamenkes Dante menyebutkan, cara paling efektif untuk mengurangi lemak trans dalam pasokan pangan adalah melalui regulasi. WHO pun mendorong negara-negara untuk mengadopsi satu dari dua kebijakan praktik terbaik eliminasi lemak trans. ',
              'Langkah pertama adalah membatasi kadar lemak trans hingga 2% dari total kandungan lemak di semua makanan. Langkah kedua, pelarangan minyak terhidrogenasi sebagian (Partially Hydrogenated Oil/PHO), termasuk pelarangan produksi, impor, penjualan, dan penggunaan PHO pada semua makanan.',
              'Untuk mendukung kebijakan ini, pada 2018 WHO meluncurkan inisiatif eliminasi lemak trans global, REPLACE, yang menyerukan negara-negara untuk mengeliminasi lemak trans secara global pada tahun 2023. ',
              'Kerangka kerja REPLACE terdiri dari 6 strategi: pertama, meninjau sumber makanan lemak trans dan lanskap kebijakan; kedua, mendorong penggantian lemak trans dengan lemak dan minyak yang lebih sehat; ketiga, memberlakukan peraturan untuk mengeliminasi lemak trans; keempat, menilai dan memantau kandungan lemak trans dalam pasokan pangan; kelima, menciptakan kesadaran di kalangan pengambil kebijakan, produsen pangan, dan masyarakat; dan keenam, memastikan kepatuhan terhadap kebijakan'
                  'Saat ini, sebanyak 53 Negara Anggota WHO telah mengadopsi kebijakan praktik terbaik eliminasi lemak trans, termasuk Denmark yang menjadi negara pertama yang menerapkan kebijakan tersebut sejak 2003.',
              '"Denmark adalah negara pertama yang melarang lemak trans dalam industri makanan dan ini sudah dilakukan sejak tahun 2003. Kenapa bisa dilakukan, karena sebelum adanya larangan ini, angka kematian akibat penyakit jantung itu sangat tinggi,” kata Wamenkes.',
              'Sepuluh tahun setelah regulasi diberlakukan, tanpa intervensi spesifik lainnya, angka kematian akibat penyakit jantung dan pembuluh darah turun 20 persen.',
              'Wamenkes Dante menegaskan, Pemerintah Indonesia juga berkomitmen penuh untuk menerapkan regulasi pelarangan penggunaan lemak trans pada industri makanan di Indonesia',
              'Wamenkes pun menilai pembatasan lemak trans akan menekan penyakit jantung sekaligus membuat Indonesia berhemat triliunan rupiah. Ia berharap penyusunan regulasi dengan melibatkan lintas sektor dapat menjadikan Indonesia negara berikutnya yang menerapkan regulasi sesuai praktik baik yang disarankan WHO.',
              '“Kami akan merumuskan regulasi tersebut di Indonesia. Dengan begitu, masyarakat akan lebih sehat sehingga angka kematian akibat penyakit jantung dan kardiovaskular turun," ujar Wamenkes. ',
              'Wamenkes menjelaskan, penerapan regulasi lemak trans akan dibarengi dengan edukasi secara masif terutama pada sektor informal seperti pedagang kecil dan menengah. ',
              '“Kini, 53 Negara Anggota WHO secara global telah mengadopsi kebijakan praktik terbaik terkait lemak trans, dan WHO bekerja sama dengan Pemerintah Indonesia untuk memastikan Indonesia menjadi negara berikutnya,” kata Perwakilan WHO untuk Indonesia, Dr. N. Paranietharan.',
              '“Rilis studi dasar WHO hari ini menandai langkah maju yang penting dalam memperbaiki lingkungan pangan bagi lebih dari 275 juta masyarakat Indonesia, memungkinkan mereka untuk hidup lebih lama dan lebih sehat,” lanjutnya. '
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

Widget _buildNewsCard5(BuildContext context, String title, String imageUrl,
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
              'Jakarta, 31 Mei 2024 – Pada Hari Tanpa Tembakau Sedunia tahun 2024, World Health Organization (WHO) mendesak para anggota dewan legislatif dan pembuat kebijakan di Indonesia untuk melindungi generasi muda dari pengaruh industri tembakau. Seruan ini  diberikan di tengah serangkaian perkembangan penting terkait peraturan yang dapat melindungi kesehatan tidak hanya generasi muda Indonesia saat ini, melainkan juga generasi-generasi mendatang.',
              'Di seluruh dunia, tembakau membunuh lebih dari 8 juta orang setiap tahun, termasuk sekitar 1,3 juta orang bukan perokok yang terpapar asap rokok orang lain.  Angka penggunaan tembakau di Indonesia merupakan salah satu yang tertinggi di dunia, dengan 35,4% orang dewasa menggunakan tembakau atau lebih dari 70 juta orang.',
              'Meskipun tingkat penggunaan tembakau pada usia 15 tahun ke atas diproyeksikan menurun di tingkat global dari 26.4% pada 2010 menjadi 18,1% pada 2030, Indonesia merupakan satu dari enam negara di dunia yang diproyeksikan mengalami peningkatan angka tersebut dari 33,2% menjadi 38,7% dalam periode yang sama. Hal ini tercermin dalam Global School-Based Student Health Survey Indonesia, yang menunjukkan penggunaan tembakau pada anak usia 13–17 tahun meningkat dari 13,6% pada 2015 menjadi 23% pada 2023. Dengan kata lain, setidaknya satu dari lima remaja saat ini menggunakan produk tembakau tertentu.',
              'Perkembangan mengkhawatirkan lain juga terjadi. Perusahaan-perusahaan tembakau berusaha membuat generasi muda jatuh dalam kecanduan pada produk-produk nikotin dan tembakau baru, seperti rokok elektronik, dengan berbagai cara yang cerdik termasuk iklan, pensponsoran, dan penambahan rasa pada produk tembakau yang menyasar kaum muda.',
              'Penelitian menunjukkan bahwa penggunaan rokok elektronik juga meningkatkan penggunaan rokok konvensional, khususnya pada orang-orang muda bukan perokok, sebanyak tiga kali lipat. Antara tahun 2011 dan 2021, pengguna produk nikotin dan tembakau baru di antara penduduk Indonesia berusia 15 tahun ke atas meningkat sebanyak 10 kali lipat menjadi 3% populasi Indonesia. Per 2023, 12,6% pelajar usia 13–17 tahun dilaporkan menggunakan rokok elektronik – angka yang jauh lebih tinggi dibandingkan pada populasi orang dewasa.',
              'Saat ini, Indonesia menempati posisi 87 dari 90 negara dalam Global Tobacco Industry Interference Index, yang mengindikasikan adanya campur tangan besar dari industri rokok dalam penyusunan kebijakan. Indonesia merupakan satu dari hanya 12 Negara Anggota WHO yang belum meratifikasi WHO Global Framework Convention on Tobacco Control, yang memberdayakan pemerintah-pemerintah dalam melawan campur tangan industri tembakau.',
              'Namun, dengan disahkannya Undang-Undang tentang Kesehatan omnibus pada tahun lalu dan sedang berlangsungnya revisi Undang-Undang tentang Penyiaran, legislator dan pembuat kebijakan memiliki kesempatan langka untuk melindungi generasi muda dari pengaruh industri tembakau serta mempercepat pembangunan kesehatan, sosial, dan ekonomi Indonesia secara keseluruhan. ',
              '“Saat ini, Indonesia berada di persimpangan penting dalam perjalanan kesehatan dan pembangunannya, terutama dalam hal pengendalian tembakau serta produk nikotin dan tembakau baru dan pembatasan dampak kesehatan, sosial, dan ekonominya yang merugikan,” kata dr. N. Paranietharan, Perwakilan WHO untuk Indonesia. “Demi kesehatan dan kesejahteraan generasi muda Indonesia saat ini dan juga setiap generasi mendatang, para legislator dan pembuat kebijakan harus mengambil langkah legislasi yang berani dan tegas.”',
              'Memastikan peraturan pelaksanaan Undang-Undang Kesehatan omnibus mencakup larangan iklan, promosi, dan pensponsoran tembakau dan produk nikotin dan tembakau baru baik di media sosial maupun di seluruh Internet harus mendapat perhatian khusus. Larangan tersebut sejalan dengan langkah-langkah MPOWER WHO, yang merupakan intervensi-intervensi terbukti untuk menurunkan permintaan untuk produk-produk tembakau.',
              'Hal ini perlu dibarengi dengan larangan iklan tembakau dan produk nikotin dan tembakau baru di media luar ruang dan ruang publik. Iklan, promosi, dan pensponsoran produk-produk tersebut secara lebih luas juga perlu dilarang, khususnya di acara-acara yang berfokus pada kaum muda seperti acara olahraga, musik, dan kesenian, sejalan dengan standar-standar global.',
              'Kedua, legislator perlu melengkapi usulan larangan penjualan produk nikotin dan tembakau baru maupun konvensional kepada orang di bawah usia 21 tahun dengan juga melarang penjualan rokok kemasan kecil, yaitu rokok yang dikemas dalam jumlah kurang dari 20 batang per bungkus. Hal ini akan menjadikan rokok lebih sulit terjangkau oleh pemuda dan sebaiknya disertai larangan penambahan rasa pada produk nikotin dan tembakau baru, sehingga banyak mengurangi daya tariknya.',
              'Selain itu, dalam rancangan Undang-Undang tentang Penyiaran, para legislator didorong untuk melarang penuh iklan, promosi, dan pensponsoran tembakau dan produk nikotin dan tembakau baru di segala format siaran. Larangan ini akan banyak menurunkan paparan iklan produk nikotin dan tembakau konvensional maupun baru di antara khalayak muda serta orang Indonesia secara keseluruhan, sehingga membantu meningkatkan denormalisasi terhadap perilaku merokok dan penggunaan vape.',
              'Terakhir, para legislator perlu menyusun dan menerapkan struktur cukai rokok yang seragam untuk segala produk tembakau dan produk nikotin dan tembakau baru serta menghapuskan batas cukai 57% dari harga ritel. Kedua tindakan ini akan lebih memungkinkan legislator untuk meningkatkan cukai menjadi 75% atau lebih dari harga ritel, sesuai salah satu praktik terbaik MPOWER.',
              'Pada titik penting ini, WHO akan terus mendukung Indonesia dalam mengubah ancaman generasional ini menjadi kesempatan langka untuk mempercepat pembangunan kesehatan, sosial, dan ekonomi Indonesia di masa sekarang serta tahun-tahun dan dekade-dekade mendatang.',
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
