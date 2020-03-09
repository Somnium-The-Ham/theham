import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';
import 'package:theham/screens/app_opinion_page.dart';
import 'package:theham/screens/auth_page.dart';
import 'package:theham/screens/delivery_page.dart';
import 'package:theham/screens/notice_page.dart';
import 'package:theham/screens/refund_page.dart';

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
    _size = MediaQuery.of(context).size;
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
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                label: Text(
                  'Log out',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              )
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleSideMenu(),
              _nickName(),
              _tabWidget(),
              FlatButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (context) => DeliveryPage());
                  Navigator.pushReplacement(context, route);
                },
                child: _getWidgetName('주문/배송 관리'),
              ),
              FlatButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (context) => RefundPage());
                  Navigator.pushReplacement(context, route);
                },
                child: _getWidgetName('환불 계좌 관리'),
              ),
              FlatButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (context) => NoticePage());
                  Navigator.pushReplacement(context, route);
                },
                child: _getWidgetName('공지사항'),
              ),
              FlatButton(
                onPressed: () {
                  final route =
                      MaterialPageRoute(builder: (context) => AppOpinionPage());
                  Navigator.pushReplacement(context, route);
                },
                child: _getWidgetName('앱 문의/건의하기'),
              ),
            ]),
      ),
    );
  }

  Padding _tabWidget() {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical: common_gap),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Table(
                      children: [
                        TableRow(children: [
                          _getTabWidgetName('사회공헌 지수'),
                          _getTabWidgetName('지난 구매 내역'),
                        ]),
                        TableRow(children: [
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: const TextStyle(),
                                  children: <TextSpan>[
                                    _getTabWidgetNum('123'),
                                    _getTabWidgetUnit("    Points"),
                                  ])),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: const TextStyle(),
                                  children: <TextSpan>[
                                    _getTabWidgetNum('22'),
                                    _getTabWidgetUnit("    건"),
                                  ])),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            );
  }

  Text _getTabWidgetName(String value) => Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      );

  TextSpan _getTabWidgetUnit(String value) {
    return TextSpan(
        text: value,
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black54));
  }

  TextSpan _getTabWidgetNum(String value) {
    return TextSpan(
        text: value,
        style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.w300, color: Colors.green));
  }

  Text _getWidgetName(String value) => Text(
        value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );

  Padding _nickName() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(style: const TextStyle(), children: <TextSpan>[
            TextSpan(
                text: "nickname",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    color: Colors.green)),
            TextSpan(
                text: "  님 환영합니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54)),
          ])),
    );
  }

  Row _titleSideMenu() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text(
            '마이페이지',
            style: TextStyle(fontSize: 20),
          ),
        )),
        IconButton(
            onPressed: null,
            icon:
                ImageIcon(AssetImage('assets/cart2.png'), color: Colors.green)),
        IconButton(
            onPressed: () {
              setState(() {
                _sideMenuOpened = !_sideMenuOpened;
              });
            },
            icon: Icon(Icons.menu),
            color: Colors.green)
      ],
    );
  }
}
