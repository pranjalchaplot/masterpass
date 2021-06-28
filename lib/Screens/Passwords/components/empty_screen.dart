import 'package:flutter/material.dart';

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
            "No Password Saved",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFDB4D06),
              fontFamily: "Pranjal",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.045,
            ),
          ),
          Text(
            "Click On The '+' Button",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3232B6),
              fontFamily: "Pranjal",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.045,
            ),
          ),
          Text(
            "to add a Password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF18A70B),
              fontFamily: "Pranjal",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.045,
            ),
          )
        ],
      ),
    );
  }
}
