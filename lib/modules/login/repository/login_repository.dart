import '../../../exports.dart';

abstract interface class LoginRepository {
  Future<void> saveUser(UserModel user);
  UserModel getUser();
}
