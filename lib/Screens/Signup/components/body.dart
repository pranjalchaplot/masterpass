import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/passwords_screen.dart';
import 'package:masterpass/Screens/Signup/components/signup_widget.dart';
import 'package:masterpass/components/build_loading.dart';
import 'package:masterpass/components/provider/google_sign_in.dart';
import 'background.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn) {
              return BuildLoading();
            } else if (snapshot.hasData) {
              final FirebaseAuth _auth = FirebaseAuth.instance;
              final userId = _auth.currentUser.uid;
              final photoURL = _auth.currentUser.photoURL;
              return PasswordScreen(
                userId: userId,
                photoURL: photoURL,
              );
            } else {
              return SignUpWidget();
            }
          },
        ),
      ),
    );
  }
}
