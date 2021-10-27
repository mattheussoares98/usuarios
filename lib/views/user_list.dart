import 'package:flutter/material.dart';
import 'package:usuarios/components/user_tile.dart';
import 'package:usuarios/data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = DUMMY_USERS;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Lista de usuários'),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) => UserTile(
          user: users.values.elementAt(i),
        ),
      ),
    );
  }
}
