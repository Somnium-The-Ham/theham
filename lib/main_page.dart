import 'package:flutter/material.dart';
import 'package:theham/screens/My_Page.dart';
import 'package:theham/screens/home_page.dart';
import 'package:theham/screens/pick_page.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int  _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Container(color: Colors.primaries[1],),
    PickPage(),
    MyPage(),
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green[100],
        type: BottomNavigationBarType.shifting,
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(activeIconPath: 'assets_insta/home_selected.png', iconPath: 'assets_insta/home.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets_insta/search_selected.png', iconPath: 'assets_insta/search.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets_insta/heart_selected.png', iconPath: 'assets_insta/heart.png'),
          _buildBottomNavigationBarItem(activeIconPath: 'assets_insta/profile_selected.png', iconPath: 'assets_insta/profile.png'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String activeIconPath, String iconPath}) {
    return BottomNavigationBarItem(
      activeIcon: activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
      icon: ImageIcon(AssetImage(iconPath)),
      title: Text(' '), //이게있어야 오류가 안남
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}