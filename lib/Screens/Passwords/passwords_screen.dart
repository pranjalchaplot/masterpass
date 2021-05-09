import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/add_password_screen.dart';
import 'package:masterpass/constants.dart';
import 'components/body.dart';
// import 'components/bottom_search_bar.dart';
import 'components/password_app_bar.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: PasswordAppBar(),
      ),
      body: Body(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 35, right: 15),
        padding: EdgeInsets.only(left: 35, right: 15, top: 3, bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.add,
                color: kPrimaryLightColor,
              ),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return AddPassword();
                }));
              },
              splashColor: Colors.transparent,
              highlightElevation: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
