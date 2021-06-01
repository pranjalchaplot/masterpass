import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Welcome/welcome_screen.dart';
import 'package:masterpass/components/constants.dart';
import 'package:provider/provider.dart';

import 'Screens/Passwords/passwords_screen.dart';
import 'components/build_loading.dart';
import 'components/provider/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterPass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChangeNotifierProvider(
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
              return PasswordScreen(
                userId: userId,
              );
            } else {
              return WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}
