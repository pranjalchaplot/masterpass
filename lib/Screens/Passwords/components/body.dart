import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';
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
  QuerySnapshot passwordsSnapshot;

  @override
  void initState() {
    super.initState();
    crudMethods.getData().then((result) {
      passwordsSnapshot = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Instagram",
        ),
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Facebook",
        ),
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Twitter",
        ),
      ],
    );
  }
}
