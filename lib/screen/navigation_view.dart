import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuru_camp/screen/home_screen/home_screen.dart';
import 'package:yuru_camp/screen/info_user.dart/info_user_screen.dart';

import 'manager_campsite/manager_camp_screen.dart';

class NavigationView extends StatefulWidget {

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  int _selectIndex = 0;

  final _pageOptions = [
    HomeScreen(),
    MngCampScreen(),
    InfoUserScreen(),
  ];

  @override
  void initState() {
    inputData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _iconTab('assets/icons/home.png'),
            activeIcon: _iconTab('assets/icons/home_orange.png'),
            label: 'trang chủ',
          ),
          BottomNavigationBarItem(
            icon: _iconTab('assets/icons/tent.png'),
            activeIcon: _iconTab('assets/icons/tent_orange.png'),
            label: 'campsite',
          ),
          BottomNavigationBarItem(
            icon: _iconTab('assets/icons/user.png'),
            activeIcon: _iconTab('assets/icons/user_orange.png'),
            label: 'tôi',
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onTapItemPage,
      ),
    );
  }

  Image _iconTab(String image) {
    return Image(image: AssetImage(image), width: 18, height: 18);
  }

  void _onTapItemPage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void inputData() {
    final User  user = auth.currentUser;
    final email = user.email;
    print(email);
  }


}
