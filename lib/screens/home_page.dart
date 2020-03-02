import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/theham_logo.png', height: 20,),
        actions: <Widget>[
          IconButton(onPressed: null ,icon: ImageIcon(AssetImage('assets/cart2.png'), color: Colors.green))
        ],
      ),
      body: Column(),
    );
  }
}
