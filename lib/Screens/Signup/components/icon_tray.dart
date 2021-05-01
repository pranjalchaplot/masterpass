import 'package:flutter/material.dart';
import 'package:masterpass/compnents/social_icon.dart';

class IconTray extends StatelessWidget {
  const IconTray({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          assetLocation: "assets/icons/facebook.svg",
          press: () {},
        ),
        SocialIcon(
          assetLocation: "assets/icons/twitter.svg",
          press: () {},
        ),
        SocialIcon(
          assetLocation: "assets/icons/google-plus.svg",
          press: () {},
        ),
      ],
    );
  }
}
