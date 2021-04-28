import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Login/components/text_field_container.dart';

import '../../../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key key,
    @required this.hintText,
    @required this.onChanged,
    this.icon = Icons.vpn_key_outlined,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  IconData suffixIcon = Icons.visibility;
  Color eyeColor = kPrimaryColor, keyColor = kPrimaryColor;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      suffixIcon = suffixIcon == Icons.visibility
          ? Icons.visibility_off
          : Icons.visibility;
      eyeColor = eyeColor == kPrimaryColor ? Colors.green : kPrimaryColor;
      keyColor = keyColor == kPrimaryColor ? Colors.green : kPrimaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: keyColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: _toggle,
            color: eyeColor,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
