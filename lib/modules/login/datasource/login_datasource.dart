abstract interface class LoginDatasource {
  Future<void> saveUser(Map<String, dynamic> data);
  String? getUser();
}
