import 'package:flutter/material.dart';
import 'package:tubes/Pages/home_pasien.dart';
import 'package:tubes/theme.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  static List<Center> halaman = [const Center(child: HomePasien())];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child:
            Icon(Icons.home_outlined, color: normalWhite), //icon inside button
        shape: CircleBorder(),
        tooltip: "Beranda",
        backgroundColor: defBlue,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: normalWhite,
        shape: CircularNotchedRectangle(), //shape of notch
        shadowColor: deactiveIcon,
        notchMargin:
            10, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
            ),
            IconButton(
              icon: Icon(
                Icons.history,
                color: deactiveIcon,
              ),
              tooltip: "Riwayat",
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person_2_outlined,
                color: deactiveIcon,
              ),
              tooltip: "Profil",
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: halaman[_currentIndex],
    );
  }
}
