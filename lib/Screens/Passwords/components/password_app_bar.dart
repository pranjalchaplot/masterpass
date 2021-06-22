import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Welcome/welcome_screen.dart';
import 'package:masterpass/components/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../../components/constants.dart';

class PasswordAppBar extends StatelessWidget {
  final photoURL;
  const PasswordAppBar({
    Key key,
    @required this.photoURL,
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
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: kPrimaryColor,
                  title: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Are You Sure You Want To Logout?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SansSerif",
                        fontSize: 18,
                        color: kPrimaryLightColor,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return WelcomeScreen();
                            },
                          ),
                        );
                      }, // passing true
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontFamily: "SansSerif",
                          color: kPrimaryLightColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, false), // passing false
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontFamily: "SansSerif",
                          color: kPrimaryLightColor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
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
          child: CircleAvatar(
            radius: size.width * 0.05,
            backgroundImage: NetworkImage(
              photoURL,
            ),
          ),
        )
      ],
    );
  }
}
