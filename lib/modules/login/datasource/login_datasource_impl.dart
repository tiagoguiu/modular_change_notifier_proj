import '../../../exports.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final LocalStorageService storageService;

  LoginDatasourceImpl(this.storageService);
  @override
  Future<void> saveUser() async {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
