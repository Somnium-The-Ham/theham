import 'package:flutter/material.dart';
import 'package:theham/main_page.dart';

void main(){
  return runApp(Theham());
}

class Theham extends StatelessWidget{

  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }

}

