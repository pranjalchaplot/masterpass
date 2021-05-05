import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/components/add_password_text_container.dart';
import '../../../constants.dart';

class AddPasswordTextField extends StatelessWidget {
  final labelText;
  final Function validator, onSaved;
  const AddPasswordTextField({
    Key key,
    this.validator,
    this.onSaved,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddPasswordTextContainer(
      child: TextFormField(
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
      ),
    );
  }
}
