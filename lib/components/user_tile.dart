import 'package:flutter/material.dart';
import 'package:usuarios/models/users.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.urlAvatar == null || user.urlAvatar!.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(
              user.urlAvatar!,
            ),
          );

    return ListTile(
      leading: avatar,
      title: Text(user.name),
    );
  }
}
