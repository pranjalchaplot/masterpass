import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterpass/Screens/Passwords/components/password_tile.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({
    Key key,
    @required this.passSnapshot,
  }) : super(key: key);

  final QuerySnapshot<Object> passSnapshot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: passSnapshot != null
            ? Column(
                children: [
                  ListView.builder(
                    itemCount: passSnapshot.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PasswordTile(
                        username: passSnapshot.docs[index].get('username'),
                        website: passSnapshot.docs[index].get('url'),
                      );
                    },
                  )
                ],
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
