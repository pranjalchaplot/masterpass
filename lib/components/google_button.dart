import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:masterpass/components/constants.dart';
import 'package:masterpass/components/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  final text;
  const GoogleButton({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: OutlinedButton.icon(
        label: Container(
          margin: EdgeInsets.only(top: size.height * 0.005),
          child: Text(
            text,
            style: TextStyle(
              fontSize: size.height * 0.022,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontFamily: "SansSerif",
            ),
          ),
        ),
        icon: Icon(
          AntDesign.google,
          size: size.height * 0.022,
          color: Colors.red,
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
