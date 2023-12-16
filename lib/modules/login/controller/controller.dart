import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../exports.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  LoginController(this.repository);

  bool isLoading = false;

  Future<void> login({required String name, required String password}) async {
    isLoading = true;
    notifyListeners();
    await repository.saveUser(UserModel(name: name, password: password));
    isLoading = false;
    notifyListeners();
    Modular.to.navigate('/collect-info');
  }

  UserModel get user => repository.getUser();
}
