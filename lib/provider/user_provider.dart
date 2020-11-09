import 'dart:async';

import 'package:avaliacao_wk_tecnology_crud/models/user.dart';
import 'package:avaliacao_wk_tecnology_crud/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserProvider with ChangeNotifier {
  Map<String, User> _item = {};

  void loadData() async {
    final response = await UserRepository().getUsersList();
    _item.addAll(response);

    notifyListeners();
  }

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  User byIndex(int i) {
    return _item.values.elementAt(i);
  }

//adicionar ou alterar
  void addUser(User user) async {
    if (user == null) {
      return;
    }
    var userRepository = UserRepository();
    userRepository.saveUser(user);

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _item.containsKey(user.id)) {
      print('Meu Id${user.id}');
      _item.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                phoneNumber: user.phoneNumber,
                email: user.email,
                occupation: user.occupation,
                imageUrl: user.imageUrl,
              ));

      notifyListeners();
    } else {
      return;
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _item.remove(user.id);
      final userParse = ParseObject('NewUser')..objectId = user.id;
      userParse.delete();
      notifyListeners();
    }
  }

  void update(User user) async {
    final parseUser = ParseObject('NewUser')..objectId = user.id;
    parseUser.set<String>('name', user.name);
    parseUser.set<String>('phoneNumber', user.phoneNumber);
    parseUser.set<String>('email', user.email);
    parseUser.set<String>('occupation', user.occupation);
    parseUser.set<String>('imageUrl', user.imageUrl);

    await parseUser.save();
    notifyListeners();
  }

  Future<void> refreshScreen() async {
    final Map<String, User> _item = {};
    final response = await UserRepository().getUsersList();
    _item.addAll(response);

    notifyListeners();
  }
}
