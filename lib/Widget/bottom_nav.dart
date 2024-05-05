import 'package:flutter/material.dart';
import 'package:tubes/Pages/home.dart';
import 'package:tubes/Pages/Profile/profile.dart';
import 'package:tubes/Pages/Kunjungan/riwayat.dart';
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
  static List<Center> halaman = [
    const Center(child: Home()),
    const Center(child: Riwayat()),
    const Center(child: Profile()),
  ];
  FloatingActionButtonLocation? _fabLocation;
  static final Map<int, FloatingActionButtonLocation> fabLocationMap = {
    0: FloatingActionButtonLocation.startDocked,
    1: FloatingActionButtonLocation.centerDocked,
    2: FloatingActionButtonLocation.endDocked,
  };
  Icon? _fabIcon;
  double dynamicPaddingLeft = 0;
  double dynamicPaddingRight = 0;


  late double sizeSpace;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    _pushedPage = widget.injectPage;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onFabLocationChanged(_currentIndex);
    });
  }

  void _onFabLocationChanged(int tabPosition) {
    if (this.mounted) {
      setState(() {
        if (_currentIndex != tabPosition) {
          _pushedPage = null;
        }
        _currentIndex = tabPosition;
        switch (tabPosition) {
          case 0:
            _setFab(tabPosition, Icons.home_outlined);
            break;
          case 1:
            _setFab(tabPosition, Icons.history_sharp);
            break;
          case 2:
            _setFab(tabPosition, Icons.person_outline_rounded);
            break;
          default:
        }
      });
    }
  }

  void _setFab(int pos, IconData icon) {
    _fabLocation = fabLocationMap[pos];
    _fabIcon = Icon(
      icon,
      color: Colors.white,
    );
    dynamicPaddingLeft = (pos == 0 ? sizeSpace : 0);
    dynamicPaddingRight = (pos == 2 ? sizeSpace : 0);
  }

  @override
  Widget build(BuildContext context) {
    sizeSpace = 2 * MediaQuery.of(context).size.width / 5;

    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: _fabIcon,
            shape: CircleBorder(),
            tooltip: "Beranda",
            backgroundColor: defBlue,
          ),
          floatingActionButtonLocation: _fabLocation,
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
                if (_currentIndex != 0) buildAnimatedButton(0, Icons.home_outlined, "Beranda"),
                if (_currentIndex != 1) buildAnimatedButton(1, Icons.history, "Riwayat"),
                if (_currentIndex != 2) buildAnimatedButton(2, Icons.person_2_outlined, "Profil"),
              ],
            ),
          ),
          body: _pushedPage ?? halaman[_currentIndex],
        );
      },
    );
  }

  AnimatedPadding buildAnimatedButton(int index, IconData icon, String tooltip) {
    double paddingLeft = (index != 2 ? dynamicPaddingLeft : 0);
    double paddingRight = (index != 0 ? dynamicPaddingRight : 0);
    return AnimatedPadding(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: IconButton(
        icon: Icon(icon, color: defBlue),
        tooltip: tooltip,
        onPressed: () {
          _onFabLocationChanged(index);
        },
      ),
    );
  }
}
