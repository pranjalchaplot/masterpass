import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/components/background.dart';
import 'package:masterpass/Services/crud.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'add_password_text_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _url, _userName, _password;
  CrudMethods crudMethods = new CrudMethods();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Widget _buildUsername() {
    return AddPasswordTextField(
      labelText: 'Username',
      validator: (String val) {
        if (val.isEmpty) return 'Username Is Required';
        var usernamePattern = r'/^[a-zA-Z0-9._]+$/';

        if (!RegExp(usernamePattern).hasMatch(val))
          return 'Please Enter a valid Username';
        return null;
      },
      onSaved: (String val) {
        _userName = val;
      },
    );
  }

  Widget _buildURL() {
    return AddPasswordTextField(
      labelText: 'Url',
      validator: (String val) {
        if (val.isEmpty) return 'Url Is Required';
        var urlPattern =
            r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

        if (!RegExp(urlPattern).hasMatch(val))
          return 'Please Enter a valid Url';
        return null;
      },
      onSaved: (String val) {
        _url = val;
      },
    );
  }

  Widget _buildPassword() {
    return AddPasswordTextField(
      labelText: 'Password',
      validator: (String val) {
        if (val.isEmpty) return 'Passwrord Is Required';
        var usernamePattern = r'/^[a-zA-Z0-9._]+$/';

        if (!RegExp(usernamePattern).hasMatch(val))
          return 'Please Enter a valid Password';
        return null;
      },
      onSaved: (String val) {
        _password = val;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildURL(),
                _buildUsername(),
                _buildPassword(),
                SizedBox(height: size.height * 0.08),
                RoundedButton(
                  text: 'Submit',
                  press: () {
                    if (!_formKey.currentState.validate()) return;
                    _formKey.currentState.save();
                    print(_url);
                    print(_userName);
                    print(_password);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
