import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theham/constants/material_white_color.dart';
import 'package:theham/main_page.dart';
import 'package:theham/screens/auth_page.dart';

void main(){
  return runApp(Theham());
}

class Theham extends StatelessWidget{

  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return MainPage();
          }
          return MainPage(); //AuthPage original
        }
      ),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}

