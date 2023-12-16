class UserModel {
  final String name;
  final String password;

  UserModel({
    this.name = '',
    this.password = '',
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'name' : name,
    'password' : password,
  };
}
