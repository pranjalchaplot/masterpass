import 'package:flutter/material.dart';
// import 'package:masterpass/Screens/Passwords/components/edit_options.dart';
import 'package:masterpass/Screens/Passwords/components/empty_screen.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';
import 'package:masterpass/components/build_loading.dart';

class PasswordList extends StatelessWidget {
  final userId;
  const PasswordList({
    Key key,
    @required this.passStream,
    @required this.userId,
  }) : super(key: key);

  final Stream<Object> passStream;

  @override
  Widget build(BuildContext context) {
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
              return BuildLoading();
            }
            if (snapshot.data.docs.length == 0) {
              return EmptyScreen();
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
                  userId: userId,
                  docId: snapshot.data.docs[index].id,
                );
              },
            );
          },
        )
      ],
    ));
  }
}
