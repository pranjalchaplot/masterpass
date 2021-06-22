import 'package:flutter/material.dart';
import 'package:masterpass/Screens/UpdatePassword/components/body.dart';

import '../../components/constants.dart';

class UpdatePassword extends StatefulWidget {
  final website, username, pass, userId, docId;
  const UpdatePassword({
    Key key,
    @required this.userId,
    @required this.docId,
    @required this.website,
    @required this.username,
    @required this.pass,
  }) : super(key: key);
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "Update Password",
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
      body: Body(
        website: widget.website,
        username: widget.username,
        pass: widget.pass,
        userId: widget.userId,
        docId: widget.docId,
      ),
    );
  }
}
