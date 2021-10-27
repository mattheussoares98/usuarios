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
      subtitle: FittedBox(
        child: Text(
          user.email,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
