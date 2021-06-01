import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masterpass/Screens/Login/components/login_button.dart';
import 'package:masterpass/Screens/Signup/components/or_divider.dart';
import 'package:masterpass/Screens/Signup/signup_screen.dart';
import 'package:masterpass/components/already_have_an_account.dart';
import 'package:masterpass/components/google_button.dart';
import 'package:masterpass/components/rounded_field_input.dart';
import 'package:masterpass/components/rounded_password_field.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
            // press: () {
            //   Navigator.pushReplacement(
            //     context,
            //     CupertinoPageRoute(builder: (context) {
            //       return PasswordScreen();
            //     }),
            //   );
            // },
            icon: Icons.verified_user,
          ),
          SizedBox(height: size.height * 0.02),
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          OrDivider(),
          GoogleButton(
            text: "Login with Google",
          ),
        ],
      ),
    );
  }
}
