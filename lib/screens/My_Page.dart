import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';
import 'package:theham/screens/auth_page.dart';

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
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.green,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
          _sideMenuOpened ? _size.width - menuWidth : _size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              icon: Icon(Icons.exit_to_app, color: Colors.white,),
              label: Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500
                ),
              ),)
            ],
          ),
        ),
      ),
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
            _titleSideMenu(),
          ],
        ),
      )
    ,
    );
  }

  Row _titleSideMenu() {
    return Row(
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: common_gap),
                child: Text('마이페이지', style: TextStyle(fontSize: 20),),
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
          );
  }
}
