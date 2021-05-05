import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masterpass/Screens/Passwords/components/website_icon.dart';
import 'package:masterpass/constants.dart';
// import 'package:masterpass/constants.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: ListTile(
        leading: WebsiteIcon(),
        title: Text(
          "Facebook",
          style: TextStyle(
            fontFamily: "TypeFace",
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "pranjalchaplot@gmail.com",
          style: TextStyle(
            fontFamily: "TypeFace",
            fontWeight: FontWeight.bold,
            color: Colors.black38,
            fontSize: size.height * 0.016,
          ),
        ),
        // trailing: IconButton(
        //   icon: Icon(
        //     Icons.copy_outlined,
        //     color: kPrimaryColor,
        //   ),
        //   onPressed: () {
        //     DropdownMenu();
        //   },
        // ),
        trailing: PopupMenuButton<String>(
          icon: Icon(
            Icons.content_copy_outlined,
            color: kPrimaryColor,
          ),
          onSelected: choiceAction,
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

void choiceAction(String choice) {
  Clipboard.setData(
    new ClipboardData(text: choice),
  );
}
