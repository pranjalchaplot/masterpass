import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masterpass/Screens/Passwords/passwords_screen.dart';
import 'package:masterpass/components/rounded_field_input.dart';
import 'package:masterpass/components/rounded_password_field.dart';
import 'package:masterpass/Screens/Signup/signup_screen.dart';
import 'package:masterpass/components/constants.dart';
import 'background.dart';
import 'login_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontFamily: "SansSerif",
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            RoundedInputField(
              icon: Icons.person_outline_outlined,
              hintText: "Enter MasterUser",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Enter MasterPass",
              onChanged: (value) {},
            ),
            LoginButton(
              text: "Login",
              press: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return PasswordScreen();
                  }),
                );
              },
              icon: Icons.verified_user,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account? ",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return SignUpScreen();
                      }),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
