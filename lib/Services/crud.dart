import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(userId, passwordData) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("passwords")
        .add(passwordData)
        .catchError((e) {
      print(e);
    });
  }

  Future getData(userId) async {
    // ignore: await_only_futures
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("passwords")
        .snapshots();
  }
}
