import 'package:modular_change_notifier_proj/exports.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<void> saveUser() {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
