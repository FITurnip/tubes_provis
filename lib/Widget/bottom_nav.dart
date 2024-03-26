import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:tubes/Pages/form_keluhan.dart';
import 'package:tubes/Pages/home.dart';
import 'package:tubes/Pages/profile.dart';
import 'package:tubes/Pages/riwayat.dart';
import 'package:tubes/theme.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  final Center? injectPage;
  const BottomNav({super.key, required this.selectedIndex, this.injectPage});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; //default page
  Center? _pushedPage;
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
  double dynamicPaddingLeft = 0;
  double dynamicPaddingRight = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.selectedIndex;
    _pushedPage = widget.injectPage;
    SchedulerBinding.instance!.addPersistentFrameCallback((_) {
      _onFabLocationChanged(_currentIndex);
    });
  }

  void _onFabLocationChanged(int tabPosition) {
    setState(() {
      if (_currentIndex != tabPosition) {
        _pushedPage = null;
      }
      _currentIndex = tabPosition;
      switch (tabPosition) {
        case 0:
          _fabLocation = FloatingActionButtonLocation.startDocked;
          _fabIcon = Icon(
            Icons.home_outlined,
            color: Colors.white,
          );
          dynamicPaddingLeft = MediaQuery.of(context).size.width / 3;
          dynamicPaddingRight = 0;
          break;
        case 1:
          _fabLocation = FloatingActionButtonLocation.centerDocked;
          _fabIcon = Icon(
            Icons.history_sharp,
            color: Colors.white,
          );
          dynamicPaddingLeft = 0;
          dynamicPaddingRight = 0;
          break;
        case 2:
          _fabLocation = FloatingActionButtonLocation.endDocked;
          _fabIcon = Icon(
            Icons.person_outline_rounded,
            color: Colors.white,
          );
          dynamicPaddingLeft = 0;
          dynamicPaddingRight = MediaQuery.of(context).size.width / 3;
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
        onPressed: () {},
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
            if (_currentIndex != 0)
              AnimatedPadding(
                padding: EdgeInsets.only(
                    left: dynamicPaddingLeft, right: dynamicPaddingRight),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: defBlue,
                  ),
                  tooltip: "Beranda",
                  onPressed: () {
                    _onFabLocationChanged(0);
                  },
                ),
              ),
            if (_currentIndex != 1)
              AnimatedPadding(
                padding: EdgeInsets.only(
                    left: dynamicPaddingLeft, right: dynamicPaddingRight),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: IconButton(
                  icon: Icon(
                    Icons.history,
                    color: defBlue,
                  ),
                  tooltip: "Riwayat",
                  onPressed: () {
                    _onFabLocationChanged(1);
                  },
                ),
              ),
            if (_currentIndex != 2)
              AnimatedPadding(
                padding: EdgeInsets.only(
                    left: dynamicPaddingLeft, right: dynamicPaddingRight),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: IconButton(
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: defBlue,
                  ),
                  tooltip: "Profil",
                  onPressed: () {
                    _onFabLocationChanged(2);
                  },
                ),
              ),
          ],
        ),
      ),
      body: _pushedPage ?? halaman[_currentIndex],
    );
  }
}