import 'dart:math';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/UpdatePassword/components/update_password_text_container.dart';
import '../../../components/constants.dart';

class UpdatePasswordField extends StatefulWidget {
  final labelText;
  final Function validator, onSaved;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const UpdatePasswordField({
    Key key,
    this.validator,
    this.onSaved,
    this.labelText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _UpdatePasswordFieldState createState() => _UpdatePasswordFieldState();
}

class _UpdatePasswordFieldState extends State<UpdatePasswordField> {
  bool _obscureText = true;
  IconData suffixIcon = Icons.visibility, passIcon = Icons.lock_outline;
  Color eyeColor = kPrimaryColor,
      genColor = kPrimaryColor,
      textColor = kPrimaryColor;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      suffixIcon = suffixIcon == Icons.visibility
          ? Icons.visibility_off
          : Icons.visibility;
      eyeColor = eyeColor == kPrimaryColor ? Colors.green : kPrimaryColor;
      genColor = genColor == kPrimaryColor ? Colors.green : kPrimaryColor;
      textColor =
          textColor == kPrimaryColor ? Colors.green[900] : kPrimaryColor;

      passIcon =
          passIcon == Icons.lock_outline ? Icons.lock_open : Icons.lock_outline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UpdatePasswordTextContainer(
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: kPrimaryColor,
            fontFamily: "SansSerif",
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.restart_alt),
                color: genColor,
                onPressed: () {
                  setState(() {
                    widget.controller.text =
                        generatePassword(true, true, true, true, 8);
                  });
                },
              ),
              IconButton(
                icon: Icon(suffixIcon),
                onPressed: _toggle,
                color: eyeColor,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        style: TextStyle(
          fontFamily: "TypeSerif",
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

String generatePassword(bool _isWithLetters, bool _isWithUppercase,
    bool _isWithNumbers, bool _isWithSpecial, double _numberCharPassword) {
  //Define the allowed chars to use in the password
  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}";

  //Create the empty string that will contain the allowed chars
  String _allowedChars = "";

  //Put chars on the allowed ones based on the input values
  _allowedChars += (_isWithLetters ? _lowerCaseLetters : '');
  _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
  _allowedChars += (_isWithNumbers ? _numbers : '');
  _allowedChars += (_isWithSpecial ? _special : '');

  int i = 0;
  String _result = "";

  //Create password
  while (i < _numberCharPassword.round()) {
    //Get random int
    int randomInt = Random.secure().nextInt(_allowedChars.length);
    //Get random char and append it to the password
    _result += _allowedChars[randomInt];
    i++;
  }

  return _result;
}
