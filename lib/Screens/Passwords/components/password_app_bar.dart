import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/add_password_screen.dart';
import '../../../components/constants.dart';

class PasswordAppBar extends StatelessWidget {
  const PasswordAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          "Passwords",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'SansSerif',
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(top: 15, right: 20),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: kPrimaryColor,
              size: size.width * 0.07,
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return AddPassword();
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
