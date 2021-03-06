import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theham/data/user.dart';

class Transformer{
  final toUser = StreamTransformer<DocumentSnapshot, User>.fromHandlers(
    handleData: (snapshot, sink) async{
      sink.add(User.fromSnapshot(snapshot));
    }
  );

}