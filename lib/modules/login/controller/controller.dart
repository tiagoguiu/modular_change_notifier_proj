import 'package:flutter/material.dart';
import '../../../exports.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  LoginController(this.repository);

  bool isLoading = false;
  bool couldProceed = false;

  Future<void> login({required String name, required String password}) async {
    isLoading = true;
    notifyListeners();
    await repository.saveUser(UserModel(name: name, password: password));
    couldProceed = true;
    notifyListeners();
  }
}
