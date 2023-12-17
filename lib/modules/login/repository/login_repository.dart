import '../../../exports.dart';

abstract interface class LoginRepository {
  Future<void> saveUser(String name, String password);
  UserModel? getUser();
}
