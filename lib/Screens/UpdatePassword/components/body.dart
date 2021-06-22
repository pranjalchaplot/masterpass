import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/UpdatePassword/components/Update_password_field.dart';
import 'package:masterpass/Screens/UpdatePassword/components/background.dart';
import 'package:masterpass/Services/crud.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'update_password_text_field.dart';
import 'package:regexpattern/regexpattern.dart';

class Body extends StatefulWidget {
  final website, username, pass, userId, docId;
  const Body({
    Key key,
    @required this.userId,
    @required this.docId,
    @required this.website,
    @required this.username,
    @required this.pass,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _url, _userName, _password;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _usernameEditingController =
      new TextEditingController();
  final TextEditingController _urlEditingController =
      new TextEditingController();
  final TextEditingController _passEditingController =
      new TextEditingController();

  Widget _updateUsername() {
    return UpdatePasswordTextField(
      labelText: 'Username',
      controller: _usernameEditingController,
      validator: (String val) {
        if (val.isEmpty) return 'Username Is Required';
        if (!val.isUsername()) return "Username Must Contain 3 Characters";
        return null;
      },
      onSaved: (String val) {
        _userName = val;
      },
    );
  }

  Widget _updateURL() {
    return UpdatePasswordTextField(
      labelText: 'Url',
      controller: _urlEditingController,
      validator: (String val) {
        if (val.isEmpty) return 'Url Is Required';
        if (!val.isUrl()) return "Invalid URL";
        return null;
      },
      onSaved: (String val) {
        _url = val;
      },
    );
  }

  Widget _updatePassword() {
    return UpdatePasswordField(
      controller: _passEditingController,
      labelText: 'Password',
      validator: (String val) {
        if (val.isEmpty) return 'Passwrord Is Required';
        if (!val.isPasswordEasy()) return "Must contain atleast 8 characters";
        return null;
      },
      onSaved: (String val) {
        _password = val;
      },
    );
  }

  updatePassword() {
    setState(() {
      _isLoading = true;
    });

    Map<String, String> passMap = {
      "url": _url,
      "username": _userName,
      "password": _password,
    };

    crudMethods.updateItem(widget.userId, passMap, widget.docId).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _passEditingController.text = widget.pass;
      _usernameEditingController.text = widget.username;
      _urlEditingController.text = widget.website;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("need to Update SomethingWentWrong()");
        }
        if (snapshot.hasData) {
          return Background(
            child: SingleChildScrollView(
              child: _isLoading
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      margin: EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _updateURL(),
                            _updateUsername(),
                            _updatePassword(),
                            SizedBox(height: size.height * 0.08),
                            RoundedButton(
                              text: 'Update',
                              press: () {
                                if (!_formKey.currentState.validate()) return;
                                _formKey.currentState.save();
                                print(_url);
                                print(_userName);
                                print(_password);
                                updatePassword();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
