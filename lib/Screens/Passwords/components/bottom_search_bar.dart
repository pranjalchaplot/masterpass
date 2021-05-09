import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class BottomSearchBar extends StatefulWidget {
  const BottomSearchBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomSearchBarState createState() => _BottomSearchBarState();
}

class _BottomSearchBarState extends State<BottomSearchBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(left: 35, right: 15),
        padding: EdgeInsets.only(left: 35, right: 15, top: 3, bottom: 3),
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              fontFamily: "TypeFace",
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
            border: InputBorder.none,
          ),
        ));
  }
}
