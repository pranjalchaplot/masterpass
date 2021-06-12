import 'package:flutter/material.dart';
import 'package:masterpass/components/constants.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      alignment: Alignment.center,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You Have No Passwords Saved",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: "Rintix",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.023,
            ),
          ),
          Text(
            "Click On The '+' Button",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xB6D8792B),
              fontFamily: "Rintix",
              // fontWeight: FontWeight.bold,
              fontSize: size.height * 0.025,
            ),
          ),
          Text(
            "To Add A Password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: "Rintix",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.023,
            ),
          )
        ],
      ),
    );
  }
}
