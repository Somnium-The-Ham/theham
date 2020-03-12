import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theham/constants/material_white_color.dart';
import 'package:theham/data/provider/my_user_data.dart';
import 'package:theham/firebase/firestore_provider.dart';
import 'package:theham/main_page.dart';
import 'package:theham/screens/auth_page.dart';
import 'package:theham/widget/my_progress_indicator.dart';

void main() {
  return runApp(ChangeNotifierProvider<MyUserData>(
      create: (context) => MyUserData(), child: Theham()));
}

bool isItFirstData = true;

class Theham extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<FirebaseUser>(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (isItFirstData) {
              isItFirstData = false;
              return MyProgressIndicator();
          }else {
              if (snapshot.hasData) {
                firestoreProvider.attemptCreateUser(userKey: snapshot.data.uid, email: snapshot.data.email);
                var myUserData = Provider.of<MyUserData>(context); // 데이터를 가져오는 방법.
                firestoreProvider.connectMyUserData(snapshot.data.uid).listen((user){
                  myUserData.setUserData(user);
                });
                return MainPage();
              }
              return AuthPage(); //AuthPage original
            }
      }
          ),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
