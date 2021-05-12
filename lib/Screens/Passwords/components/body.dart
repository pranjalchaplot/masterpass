import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_list.dart';
import 'package:masterpass/Services/crud.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot passSnapshot;

  @override
  void initState() {
    super.initState();
    crudMethods.getData().then((result) {
      passSnapshot = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PasswordList(passSnapshot: passSnapshot);
  }
}
