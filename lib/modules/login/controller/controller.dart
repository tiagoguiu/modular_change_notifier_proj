import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../exports.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  LoginController(this.repository);

  bool isLoading = false;
  UserModel? get user => repository.getUser();

  Future<void> login({required String name, required String password}) async {
    isLoading = true;
    notifyListeners();
    await repository.saveUser(name,password);
    isLoading = false;
    notifyListeners();
    Modular.to.navigate('/collect-info');
  }

}
