import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterpass/Screens/Login/login_screen.dart';
import 'package:masterpass/components/already_have_an_account.dart';

import 'google_signup_button.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign Up",
          style: TextStyle(
            fontFamily: "SansSerif",
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.05,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        SvgPicture.asset(
          "assets/icons/signup.svg",
          height: size.height * 0.3,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        GoogleSignUpButton(),
        SizedBox(
          height: size.height * 0.01,
        ),
        AlreadyHaveAnAccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
