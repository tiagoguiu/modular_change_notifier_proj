import 'package:flutter/material.dart';
import '../../../exports.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  LoginController(this.repository);
  bool isLoading = false;

  Future<void> login({required String name, required String password}) async {}
}
