import 'dart:convert';

import 'package:modular_change_notifier_proj/exports.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<void> saveUser(UserModel user) async {
    await datasource.saveUser(user.toMap());
  }

  @override
  UserModel? getUser() {
    final user = datasource.getUser();
    return user != null ? UserModel.fromMap(jsonDecode(user)) : null;
  }
}
