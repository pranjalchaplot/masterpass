import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Instagram",
        ),
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Facebook",
        ),
        PasswordTile(
          username: "pranjalchaplot@gmail.com",
          website: "Twitter",
        ),
      ],
    );
  }
}
