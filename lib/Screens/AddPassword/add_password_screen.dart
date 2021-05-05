import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/components/body.dart';

import '../../constants.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "Add Password",
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: "SansSerif",
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.07,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
