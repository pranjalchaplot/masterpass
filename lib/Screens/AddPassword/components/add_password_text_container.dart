import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddPasswordTextContainer extends StatefulWidget {
  final Widget child;
  const AddPasswordTextContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _AddPasswordTextContainerState createState() =>
      _AddPasswordTextContainerState();
}

class _AddPasswordTextContainerState extends State<AddPasswordTextContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget.child,
    );
  }
}
