import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masterpass/Screens/Login/components/rounded_field_input.dart';
import 'package:masterpass/Screens/Login/components/rounded_password_field.dart';
import 'package:masterpass/Screens/Welcome/components/rounded_button.dart';
import 'background.dart';

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
              "LOGIN",
              style: TextStyle(
                fontFamily: "SansSerif",
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
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
            RoundedButton(
              text: "LOGIN",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
