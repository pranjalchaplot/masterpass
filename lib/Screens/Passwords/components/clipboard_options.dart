import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:masterpass/components/constants.dart';

class ClipboardOptions extends StatelessWidget {
  const ClipboardOptions({
    Key key,
    @required this.username,
    @required this.pass,
  }) : super(key: key);

  final username;
  final pass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
  ];
}
