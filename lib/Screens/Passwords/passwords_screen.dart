import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/bottom_search_bar.dart';
import 'components/password_app_bar.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: PasswordAppBar(),
      ),
      body: Body(),
      floatingActionButton: BottomSearchBar(),
    );
  }
}
