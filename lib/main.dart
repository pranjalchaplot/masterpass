import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));
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
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
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
              final photoURL = _auth.currentUser.photoURL;
              return PasswordScreen(
                userId: userId,
                photoURL: photoURL,
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
