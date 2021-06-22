import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/clipboard_options.dart';
import 'package:masterpass/Screens/Passwords/components/edit_options.dart';
import 'package:masterpass/Screens/Passwords/components/website_icon.dart';

class PasswordTile extends StatelessWidget {
  final website, username, pass, docId, userId;
  const PasswordTile({
    Key key,
    @required this.website,
    @required this.username,
    @required this.pass,
    @required this.docId,
    @required this.userId,
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipboardOptions(username: username, pass: pass),
            EditOptions(
              docId: docId,
              userId: userId,
            ),
          ],
        ),
      ),
    );
  }
}
