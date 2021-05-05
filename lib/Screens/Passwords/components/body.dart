import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/character_list.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CharacterList(
          letter: "P",
        ),
        CharacterList(
          letter: "R",
        ),
        CharacterList(
          letter: "A",
        ),
      ],
    );
  }
}
