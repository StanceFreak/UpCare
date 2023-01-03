import 'package:emr_mobile/views/HomePage.dart';
import 'package:emr_mobile/views/ProfilePage.dart';
import 'package:emr_mobile/views/QRCodePage.dart';
import 'package:flutter/material.dart';
import 'package:emr_mobile/nav_icons_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final List<Widget> pages = [HomePage(), QRCodePage(), ProfilePage()];

  void _changeSelectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const greenLightColor = Color(0xFF7bbc18);
    const darkBlueColor = Color(0xFF233b43);
    const whiteGreyColor = Color(0xFFedeff1);
    const whiteColor = Color(0xFFF2F3F5);
    const blueColor = Color(0xFF77ACF1);
    DateTime pressedButtonTime = DateTime.now();

    Future<bool> _onWillPop() {
      DateTime now = DateTime.now();
      if (now.difference(pressedButtonTime) > Duration(seconds: 2)) {
        pressedButtonTime = now;
        Fluttertoast.showToast(msg: 'Tekan sekali lagi untuk keluar');
        return Future.value(false);
      }
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _changeSelectedIndex,
            currentIndex: currentIndex,
            unselectedIconTheme: IconThemeData(color: whiteGreyColor),
            unselectedItemColor: whiteGreyColor,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
            selectedIconTheme: IconThemeData(color: whiteGreyColor, size: 27),
            selectedItemColor: whiteColor,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            backgroundColor: greenLightColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(NavIcons.home_svgrepo_com),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(NavIcons.qr_svgrepo_com__1_),
                label: 'QRCode',
              ),
              BottomNavigationBarItem(
                icon: Icon(NavIcons.user_svgrepo_com),
                label: 'User',
              ),
            ]),
      ),
    );
  }
}
