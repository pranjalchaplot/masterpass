import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Welcome/welcome_screen.dart';
import 'package:masterpass/components/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
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
      leading: Container(
        margin: EdgeInsets.only(top: 15, left: 20),
        child: IconButton(
          icon: Icon(
            Icons.logout,
            color: kPrimaryColor,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return WelcomeScreen();
            }));
          },
        ),
      ),
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
                    return Container();
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
