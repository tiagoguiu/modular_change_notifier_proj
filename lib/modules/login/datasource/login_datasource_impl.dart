import 'dart:convert';

import '../../../exports.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final LocalStorageService storageService;

  LoginDatasourceImpl(this.storageService);
  @override
  Future<void> saveUser(Map<String,dynamic> data) async {
    await storageService.write('user', jsonEncode(data));
  }
}