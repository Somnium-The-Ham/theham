import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        actions: <Widget>[
          IconButton(onPressed: null ,icon: ImageIcon(AssetImage('assets/cart2.png'), color: Colors.green))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: common_gap),
                child: Text('username'),
              )),
              IconButton(onPressed: null, icon: IconButton(onPressed: null ,icon: ImageIcon(AssetImage('assets_insta/grid.png'), color: Colors.green)))
            ],
          ),
        ],
      ),
    );
  }
}
