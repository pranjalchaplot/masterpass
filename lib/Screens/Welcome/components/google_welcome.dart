import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:masterpass/components/constants.dart';
import 'package:masterpass/components/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleWelcomeButton extends StatelessWidget {
  final text;
  const GoogleWelcomeButton({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: OutlinedButton.icon(
        label: Container(
          width: size.width * 0.6,
          height: size.height * 0.05,
          padding: EdgeInsets.only(top: size.height * 0.0081),
          child: Text(
            text,
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.030,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontFamily: "SansSerif",
            ),
          ),
        ),
        icon: Container(
          padding: EdgeInsets.only(bottom: size.height * 0.0081),
          child: Icon(
            Ionicons.logo_google,
            size: size.height * 0.03,
            color: Colors.red,
          ),
        ),
        style: OutlinedButton.styleFrom(
          alignment: Alignment.center,
          shape: StadiumBorder(),
          side: BorderSide(color: kPrimaryLightColor),
        ),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
      ),
    );
  }
}
