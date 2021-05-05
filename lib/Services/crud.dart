import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(passwordData) async {
    FirebaseFirestore.instance
        .collection("passwords")
        .add(passwordData)
        .catchError((e) {
      print(e);
    });
  }
}
