import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    Key key,
    @required this.letter,
  }) : super(key: key);

  final letter;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        children: [
          Text(
            letter,
            style: TextStyle(
              fontFamily: "TypeFace",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.03,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          PasswordTile(),
          PasswordTile(),
        ],
      ),
    );
  }
}
