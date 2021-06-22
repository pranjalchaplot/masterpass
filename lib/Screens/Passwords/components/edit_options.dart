import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:masterpass/Screens/EditPassword/edit_password_screen.dart';
import 'package:masterpass/Services/crud.dart';
import 'package:masterpass/components/constants.dart';

class EditOptions extends StatefulWidget {
  final userId, docId;
  const EditOptions({
    Key key,
    @required this.docId,
    @required this.userId,
  }) : super(key: key);

  @override
  _EditOptionsState createState() => _EditOptionsState();
}

class _EditOptionsState extends State<EditOptions> {
  CrudMethods crudMethods = new CrudMethods();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: PopupMenuButton<String>(
        icon: Icon(
          Feather.edit,
          color: kPrimaryColor,
          size: size.height * 0.030,
        ),
        onSelected: (String choice) {
          if (choice == '✏ Update Password') {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return EditPassword();
                },
              ),
            );
          } else
            crudMethods.deleteData(widget.userId, widget.docId);
          // else if(choice == '')
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: kPrimaryColor,
        itemBuilder: (BuildContext context) {
          return Constants.choices.map((String choice) {
            return PopupMenuItem<String>(
              height: 50,
              value: choice,
              textStyle: TextStyle(
                fontFamily: "SansSerif",
                color: kPrimaryLightColor,
              ),
              padding: EdgeInsets.only(left: 10),
              child: Text(
                choice,
                textAlign: TextAlign.center,
                // style: ,
              ),
            );
          }).toList();
        },
      ),
    );
  }
}

class Constants {
  static const String FirstItem = '✏ Update Password';
  static const String SecondItem = '❌ Delete Password';
  // static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    // ThirdItem,
  ];
}
