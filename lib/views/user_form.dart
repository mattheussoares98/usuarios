import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usuarios/provider/users_provider.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
