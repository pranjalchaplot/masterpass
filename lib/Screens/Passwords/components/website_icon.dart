import 'package:flutter/material.dart';
import '../../../components/constants.dart';

class WebsiteIcon extends StatelessWidget {
  const WebsiteIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: kPrimaryLightColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        "assets/images/web-icon-0.jpg",
        height: 35,
        width: 35,
        color: kPrimaryColor,
      ),
    );
  }
}
