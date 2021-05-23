import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:masterpass/Screens/Passwords/components/website_icon.dart';
import 'package:masterpass/components/constants.dart';
// import 'package:masterpass/constants.dart';

class PasswordTile extends StatelessWidget {
  final website, username, pass;
  const PasswordTile({
    Key key,
    @required this.website,
    @required this.username,
    @required this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: ListTile(
        leading: WebsiteIcon(),
        title: Text(
          website,
          style: TextStyle(
            fontFamily: "TypeFace",
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.025,
          ),
        ),
        subtitle: Text(
          username,
          style: TextStyle(
            fontFamily: "TypeFace",
            fontWeight: FontWeight.bold,
            color: Colors.black38,
            fontSize: size.height * 0.018,
          ),
        ),
        trailing: Container(
          // margin: EdgeInsets.only(right: 4),
          child: PopupMenuButton<String>(
            icon: Icon(
              Feather.copy,
              color: kPrimaryColor,
              size: size.height * 0.030,
            ),
            onSelected: (String choice) {
              Clipboard.setData(
                new ClipboardData(
                  text: choice == 'Copy Username' ? username : pass,
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: kPrimaryColor,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(
                      fontFamily: "SansSerif",
                      color: kPrimaryLightColor,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}

class Constants {
  static const String FirstItem = 'Copy Username';
  static const String SecondItem = 'Copy Password';
  // static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    // ThirdItem,
  ];
}
