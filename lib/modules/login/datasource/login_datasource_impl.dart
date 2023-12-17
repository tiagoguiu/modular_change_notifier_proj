import 'dart:convert';

import '../../../exports.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final LocalStorageService storageService;

  LoginDatasourceImpl(this.storageService);
  @override
  Future<void> saveUser(Map<String, dynamic> data) async {
    await storageService.write('user', jsonEncode(data));
  }

  @override
  String? getUser() {
    return storageService.contains('user') ? storageService.read('user') : null;
  }
}
