import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterpass/Screens/Login/login_screen.dart';
import 'package:masterpass/Screens/Signup/components/or_divider.dart';
import 'package:masterpass/components/already_have_an_account.dart';
import 'package:masterpass/components/rounded_field_input.dart';
import 'package:masterpass/components/rounded_password_field.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'background.dart';
import 'icon_tray.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key key,
    @required this.child,
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
              "Sign Up",
              style: TextStyle(
                fontFamily: "SansSerif",
                fontWeight: FontWeight.bold,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.3,
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
            IconTray(),
          ],
        ),
      ),
    );
  }
}
