import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theham/constants/firebase_keys.dart';
import 'package:theham/data/user.dart';
import 'package:theham/firebase/transformer.dart';

class FirestoreProvider with Transformer {
  final Firestore _fireStore = Firestore.instance;

  // 데이터 저장하는 부분
  Future<void> attemptCreateUser({String userKey, String email}) {
    final DocumentReference userRef =
        _fireStore.collection(COLLECTION_USERS).document(userKey);
    return _fireStore.runTransaction((Transaction tx) async {
      DocumentSnapshot snapshot = await tx.get(userRef);
      if (snapshot.exists) {
        return;
      } else {
        await tx.set(userRef, User.getMapForCreateUser(email));
      }
    });
  }

  // 데이터 가져오기 부분
  Stream<User> connectMyUserData(String userKey) {
    return _fireStore
        .collection(COLLECTION_USERS)
        .document(userKey)
        .snapshots()
        .transform(toUser);
  }

//  Future<void> sendData() {
//    return Firestore.instance
//        .collection('Users')
//        .document('123123123')
//        .setData({'email': 'testing@test.com', 'author': 'author'});
//  }
//
//  void getData() {
//    Firestore.instance
//        .collection('Users')
//        .document('123123123')
//        .get()
//        .then((DocumentSnapshot ds) {
//      print(ds.data);
//    });
//  }
}

FirestoreProvider firestoreProvider = FirestoreProvider();
