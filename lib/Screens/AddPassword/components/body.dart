import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/AddPassword/components/add_password_field.dart';
import 'package:masterpass/Screens/AddPassword/components/background.dart';
import 'package:masterpass/Services/crud.dart';
import 'package:masterpass/components/rounded_button.dart';
import 'add_password_text_field.dart';
import 'package:regexpattern/regexpattern.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _url, _userName, _password;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _textEditingController =
      new TextEditingController();

  Widget _buildUsername() {
    return AddPasswordTextField(
      labelText: 'Username',
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

  Widget _buildURL() {
    return AddPasswordTextField(
      labelText: 'Url',
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

  Widget _buildPassword() {
    return AddPasswordField(
      controller: _textEditingController,
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

  uploadPassword() {
    setState(() {
      _isLoading = true;
    });

    // Reference firebaseStorageRef =
    //     FirebaseStorage.instance.ref().child("websiteIcon").child("$uri.jpg");
    print("hello");
    Map<String, String> passMap = {
      "url": _url,
      "username": _userName,
      "password": _password,
    };

    crudMethods.addData(passMap).then((value) {
      print("yeah");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          //TODO
          print("need to add SomethingWentWrong()");
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
                                uploadPassword();
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
