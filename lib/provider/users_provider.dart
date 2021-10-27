import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:usuarios/data/dummy_users.dart';
import 'package:usuarios/models/users.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  put(User user) {
    if (_items.containsKey(user.id)) {
      _items.update(
        user.id!,
        (_) => User(
          name: user.name,
          email: user.email,
          urlAvatar: user.urlAvatar,
          id: user.id,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          urlAvatar: user.urlAvatar,
        ),
      );
    }
    notifyListeners();
  }

  remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
