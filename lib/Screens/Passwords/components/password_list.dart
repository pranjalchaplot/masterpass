import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';
import 'package:masterpass/components/constants.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({
    Key key,
    @required this.passStream,
  }) : super(key: key);

  final Stream<Object> passStream;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        StreamBuilder(
          stream: passStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data.docs.length == 0) {
              return Container(
                height: size.height * 0.6,
                alignment: Alignment.center,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                      child: Image.asset(
                        "assets/images/add_files_password_screen.png",
                        width: size.width * 0.55,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      "You Have No Password Saves \nClick On The '+' Button \nto Add Passwords",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontFamily: "TypeFace",
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.028,
                      ),
                    )
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PasswordTile(
                  username: snapshot.data.docs[index].data()['username'],
                  website: snapshot.data.docs[index].data()['url'],
                  pass: snapshot.data.docs[index].data()['password'],
                );
              },
            );
          },
        )
      ],
    ));
  }
}
