final spaceRegexp = RegExp(r'\s+$');

String? loginValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'O campo não pode ser vazio';
  }
  if (spaceRegexp.hasMatch(value)) {
    return 'O campo não pode terminar com espaço vazio';
  }
  if (value.length < 2) {
    return 'O campo deve conter mais de dois caracteres';
  }
  return null;
}