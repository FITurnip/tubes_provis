import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/calendar.dart';
import 'package:tubes/Pages/detail_dokter.dart';

class ListDokter extends StatefulWidget {
  const ListDokter({super.key});

  @override
  State<ListDokter> createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Dokter",
          style: getDefaultTextStyle(font_size: 20, font_color: blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListDokterContent(),
    );
  }
}

class ListDokterContent extends StatefulWidget {
  const ListDokterContent({Key? key}) : super(key: key);

  @override
  _ListDokterContentState createState() => _ListDokterContentState();
}

class _ListDokterContentState extends State<ListDokterContent> {
    void onDoctorCardTapped(String name, String specialty, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDokter(
          name: name,
          specialty: specialty,
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text("Daftar Dokter pada Tanggal ...", style: getDefaultTextStyle(font_size: 20, font_color: blackColor),)
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                DoctorCard(
                  name: "dr. Marsha Julian",
                  specialty: "Dokter Umum",
                  image: "assets/img/dokter/dokter1.jpg",
                  onTap: () => onDoctorCardTapped(
                      "dr. Marsha Julian", "Dokter Umum", "assets/img/dokter/dokter1.jpg"),
                ),
                SizedBox(height: 20),
                DoctorCard(
                  name: "dr. Patrick Wong",
                  specialty: "Dokter Spesialis Penyakit Dalam",
                  image: "assets/img/dokter/dokter2.jpg",
                  onTap: () => onDoctorCardTapped(
                      "dr. Patrick Wong", "Dokter Umum", "assets/img/dokter/dokter2.jpg"),
                ),
                SizedBox(height: 20),
                DoctorCard(
                  name: "dr. Susana Ramirez",
                  specialty: "Dokter Umum",
                  image: "assets/img/dokter/dokter3.jpg",
                  onTap: () => onDoctorCardTapped(
                      "dr. Susana Ramirez", "Dokter Umum", "assets/img/dokter/dokter3.jpg"),
                ),
                SizedBox(height: 20),
                DoctorCard(
                  name: "dr. Jane Smith",
                  specialty: "Dokter Kulit",
                  image: "assets/img/dokter/dokter4.jpg",
                  onTap: () => onDoctorCardTapped(
                      "dr. Jane Smith", "Dokter Umum", "assets/img/dokter/dokter4.jpg"),
                ),
                SizedBox(height: 20),
                DoctorCard(
                  name: "dr. Freya Glory",
                  specialty: "Dokter Umum",
                  image: "assets/img/dokter/dokter5.jpg",
                  onTap: () => onDoctorCardTapped(
                      "dr. Freya Glory", "Dokter Umum", "assets/img/dokter/dokter5.jpg"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final VoidCallback onTap; 

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.image,
    required this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          decoration: BoxDecoration(
            color: normalWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: getDefaultTextStyle(font_size: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        specialty,
                        style: getDefaultTextStyle(font_size: 13),
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
}

