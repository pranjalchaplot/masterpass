import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection("users");

class CrudMethods {
  Future<void> addData(userId, passwordData) async {
    await _mainCollection
        .doc(userId)
        .collection("passwords")
        .add(passwordData)
        .catchError((e) {
      print(e);
    });
  }

  Future getData(userId) async {
    return _mainCollection.doc(userId).collection("passwords").snapshots();
  }

  Future<void> updateItem(userId, passwordData, docId) async {
    //TODO
    //copy below
    // Map<String, dynamic> data = <String, dynamic>{
    //   "title": title,
    //   "description": description,
    // };

    await _mainCollection
        .doc(userId)
        .collection('passwords')
        .doc(docId)
        .update(passwordData)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteData(userId, docId) async {
    await _mainCollection
        .doc(userId)
        .collection("passwords")
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
