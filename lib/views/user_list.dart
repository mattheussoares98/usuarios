import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usuarios/components/user_tile.dart';
import 'package:usuarios/provider/users_provider.dart';
import 'package:usuarios/routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Center(
          child: Text('Lista de usuários'),
        ),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, i) => UserTile(
          user: users.all[i],
        ),
      ),
    );
  }
}
