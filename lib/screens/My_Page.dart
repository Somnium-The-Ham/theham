import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _sideMenuOpened = false;
  Size _size;
  double menuWidth;
  int duration = 400;

  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    menuWidth = _size.width / 2;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.green,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
          _sideMenuOpened ? _size.width - menuWidth : _size.width, 0, 0),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(milliseconds: duration),
      transform:
      Matrix4.translationValues(_sideMenuOpened ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: common_gap),
                  child: Text('마이페이지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                )),
                IconButton(
                    onPressed: null,
                    icon: ImageIcon(AssetImage('assets/cart2.png'),
                        color: Colors.green)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _sideMenuOpened = !_sideMenuOpened;
                      });
                    },
                    icon: Icon(Icons.menu), color: Colors.green)
              ],
            )
          ],
        ),
      )
    ,
    );
  }
}
