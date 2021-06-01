import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_list.dart';
import 'package:masterpass/Services/crud.dart';

class Body extends StatefulWidget {
  final userId;
  const Body({
    Key key,
    @required this.userId,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CrudMethods crudMethods = new CrudMethods();

  Stream passStream;

  @override
  void initState() {
    super.initState();
    crudMethods.getData(widget.userId).then((result) {
      setState(() {
        passStream = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Sonething Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return PasswordList(
              passStream: passStream,
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
