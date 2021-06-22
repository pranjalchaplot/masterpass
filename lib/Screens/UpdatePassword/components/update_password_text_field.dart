import 'package:flutter/material.dart';
import 'package:masterpass/Screens/UpdatePassword/components/update_password_text_container.dart';
import '../../../components/constants.dart';

class UpdatePasswordTextField extends StatelessWidget {
  final labelText;
  final Function validator, onSaved;
  final TextEditingController controller;
  const UpdatePasswordTextField({
    Key key,
    this.validator,
    this.onSaved,
    this.labelText,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UpdatePasswordTextContainer(
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: kPrimaryColor,
              fontFamily: "SansSerif",
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
          ),
          validator: validator,
          onSaved: onSaved,
          style: TextStyle(
            fontFamily: "TypeSerif",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }
}
