import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/Widget/pressable_widget.dart';
import 'package:tubes/theme.dart';
import 'package:tubes/Widget/rounded_image.dart';

enum gender { pria, wanita }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _nomorBpjs = "";
  gender? genderSelected;
  String? _selectedOption;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: RoundedImage(
                    imagePath: 'assets/img/photo_profile.png', // Replace with your image path
                    size: 100.0, // Adjust as needed
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children : [
                    Text("Samdysara Saragih", style :GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20.0, // Adjust as needed
                        fontWeight: FontWeight.w600, // Set text weight
                        overflow: TextOverflow.ellipsis
                        ))),
                    Text(DateFormat("d MMMM y", "id_ID").format(DateTime.parse('2024-01-08 09:45:00'))),
                    Text("saragih@gmail.com"),
                  ]
                ),
              ]
            ),
            const SizedBox(height:25),
            Image.asset('assets/img/bpjs.png', width: 184.56, height: 114.43),
            FormInput(label: "Nomor BPJS"),
            FormInput(label: "Jenis Kelamin", widget: SelectionBox()),
            FormInput(label: "Nomor Telepon"),
            FormInput(label: "Kata Sandi"),
          ]
        ),
      )
    );
  }
}

class FormInput extends StatelessWidget {
  String _formInput = "";
  final String label;
  Widget ?widget;

  FormInput({
    required this.label,
    this.widget
  });

  @override
  Widget build(BuildContext context) {
    if(widget == null) {
      widget = Container(
        height: 38,
        child: TextField(
          decoration: InputDecoration(contentPadding: EdgeInsets.zero),
          onChanged: (text) {
            _formInput = text;
          },
        )
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(child: widget),
        ]
      )
    );
  }
}

// bagian ini nanti buat jadi component sendiri
class SelectionBox extends StatelessWidget {
  double borderRadius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PressableWidget(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: defBlue,
            ),
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                color: defBlue,
              ),
              child: Text("Laki-laki", style: TextStyle(color: Colors.white))
            )
          )
        ),
        SizedBox(width: 10),
        PressableWidget(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: basicYellow,
            ),
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: basicYellow,
                  width: 1.0,
                ),
                color: basicYellow,
              ),
              child: Text("Perempuan", style: TextStyle(color: Colors.white))
            )
          )
        ),
      ]
    );
  }
}