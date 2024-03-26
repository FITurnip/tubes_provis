import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
        title: CustomAppBar(),
      ),
      body: HomeContent(),
    );
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
              Text(
                "Buat janji dengan dokter?",
                style: getDefaultTextStyle(font_size: 15),
              ),
              ElevatedButton(
                  onPressed: () => {},
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
            child: listJanji(),
          )
        ],
      ),
    );
  }
}


