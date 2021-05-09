import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Login/login_screen.dart';
import 'package:masterpass/Screens/Signup/signup_screen.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'package:masterpass/components/constants.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // size (height and width) will change according to screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to MasterPass \n #1 Password Manager in India 🇮🇳",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SansSerif',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              "assets/icons/welcome.png",
              width: size.width * 0.6,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            RoundedButton(
              text: "Sign Up",
              press: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return SignUpScreen();
                  }),
                );
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
