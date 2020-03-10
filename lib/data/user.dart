import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theham/constants/firebase_keys.dart';

class User {
  final String userKey;
  final String username;
  final String email;
  final String phone_number;
  final String address;
  final String participation_point;

  final DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, this.userKey, {this.reference})
      : username = map[KEY_USERNAME],
        email = map[KEY_EMAIL],
        phone_number = map[KEY_PHONE_NUMBER],
        address = map[KEY_ADDRESS],
        participation_point = map[KEY_PARTICIPATION_POINTS];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
    snapshot.data, snapshot.documentID, reference: snapshot.reference,);

  static Map<String, dynamic> getMapForCreateUser(String email) {
    Map<String, dynamic> map = Map();
    map[KEY_EMAIL] = email;

    return map;
  }
}
