import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterpass/Screens/Login/login_screen.dart';
import 'package:masterpass/Screens/Signup/components/or_divider.dart';
import 'package:masterpass/components/already_have_an_account.dart';
import 'package:masterpass/components/google_button.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'package:masterpass/components/rounded_field_input.dart';
import 'package:masterpass/components/rounded_password_field.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: "SansSerif",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.20,
          ),
          RoundedInputField(
            icon: Icons.email_rounded,
            hintText: "Your MasterEmail",
            onChanged: (value) {},
          ),
          RoundedInputField(
            icon: Icons.person_outline,
            hintText: "Your MasterID",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            // icon: Icons.lock,
            hintText: "Your MasterPass",
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "Sign Up",
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
          OrDivider(),
          GoogleButton(text: "Sign In with Google"),
        ],
      ),
    );
  }
}
