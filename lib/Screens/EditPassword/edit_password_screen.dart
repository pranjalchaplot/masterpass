import 'package:flutter/material.dart';
import 'package:masterpass/Screens/EditPassword/components/body.dart';

import '../../components/constants.dart';

class EditPassword extends StatefulWidget {
  final userId;
  const EditPassword({
    Key key,
    this.userId,
  }) : super(key: key);
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
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
