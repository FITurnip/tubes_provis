import 'package:flutter/material.dart';
import 'package:tubes/list_wel.dart';
import 'package:tubes/Pages/login_page.dart';
import 'package:tubes/theme.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map(
        (item) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200.0),
            Text(
              item['header'],
              style: getDefaultTextStyle(
                font_weight: FontWeight.w300,
                font_color: basicYellow,
                font_size: 50.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item['image'],
                  fit: BoxFit.contain,
                  width: 300.0,
                  height: 250.0,
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              item['description'],
              style: getDefaultTextStyle(
                font_weight: FontWeight.normal,
                font_color: blackColor,
                font_size: 16.0,
              ).copyWith(
                letterSpacing: 1.2,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
        slides.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: currentPage.round() == index
                ? blackColor
                : blackColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );

  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  // Fungsi untuk menavigasi ke halaman login
  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return slides[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 70.0),
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
          if (currentPage == 2.0)
            Positioned(
              bottom: 75.0,
              left: 0,
              right: 0,
              child: GestureDetector(
                // Mengubah teks menjadi widget interaktif
                onTap:
                    navigateToLogin, // Panggil fungsi navigateToLogin saat teks ditekan
                child: Center(
                  child: Text(
                    "Login / Daftar",
                    style: getDefaultTextStyle(
                      font_size: 16,
                      font_weight: FontWeight.bold,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
