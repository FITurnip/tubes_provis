import 'package:flutter/material.dart';
import 'package:tubes/Pages/form_keluhan.dart';
import 'package:tubes/Pages/home.dart';
import 'package:tubes/Pages/profile.dart';
import 'package:tubes/Pages/riwayat.dart';
import 'package:tubes/theme.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  const BottomNav({super.key, required this.selectedIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; //default page

  //list page
  static List<Center> halaman = [
    const Center(child: Home()),
    const Center(child: Riwayat()),
    const Center(child: Profile()),
  ];
  FloatingActionButtonLocation? _fabLocation;
  Icon? _fabIcon;
  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endDocked,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.selectedIndex;
    _onFabLocationChanged(_currentIndex);
  }

  void _onFabLocationChanged(int tabPosition) {
    setState(() {
      _currentIndex = tabPosition;
      switch (tabPosition) {
        case 0:
          _fabLocation = FloatingActionButtonLocation.startDocked;
          _fabIcon = Icon(
            Icons.home_outlined,
            color: Colors.white,
          );
          break;
        case 1:
          _fabLocation = FloatingActionButtonLocation.centerDocked;
          _fabIcon = Icon(
            Icons.history_sharp,
            color: Colors.white,
          );
          break;
        case 2:
          _fabLocation = FloatingActionButtonLocation.endDocked;
          _fabIcon = Icon(
            Icons.person_outline_rounded,
            color: Colors.white,
          );
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: _fabIcon, //icon inside button
        shape: CircleBorder(),
        tooltip: "Beranda",
        backgroundColor: defBlue,
      ),

      floatingActionButtonLocation: _fabLocation,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (_currentIndex == 0) Padding(padding: EdgeInsets.only(left: 15)),
            if (_currentIndex != 0)
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: deactiveIcon,
                ),
                tooltip: "Beranda",
                onPressed: () {
                  _onFabLocationChanged(0);
                },
              ),
            if (_currentIndex != 1)
              IconButton(
                icon: Icon(
                  Icons.history,
                  color: deactiveIcon,
                ),
                tooltip: "Riwayat",
                onPressed: () {
                  _onFabLocationChanged(1);
                },
              ),
            if (_currentIndex == 2)
              Padding(padding: EdgeInsets.only(right: 15)),
            if (_currentIndex != 2)
              IconButton(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: deactiveIcon,
                ),
                tooltip: "Profil",
                onPressed: () {
                  _onFabLocationChanged(2);
                },
              ),
          ],
        ),
      ),
      body: halaman[_currentIndex],
    );
  }
}
